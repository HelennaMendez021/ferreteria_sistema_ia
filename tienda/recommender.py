import pandas as pd
from sklearn.metrics.pairwise import cosine_similarity
from .models import Interaccion, Producto


def recomendaciones_hibridas(usuario_id, limite=10):
    # 1. Obtener todas las interacciones ordenadas por fecha
    interacciones_qs = Interaccion.objects.filter(usuario_id=usuario_id).order_by('-id')
    
    if not interacciones_qs.exists():
        return Producto.objects.order_by('?')[:limite]

    # 2. Procesar interacciones con pesos temporales y detección de Pivot
    recientes = list(interacciones_qs[:5])
    historicas = list(interacciones_qs[5:])
    
    reset_historial = False
    if len(recientes) >= 5:
        clusters_recientes = {i.producto.cluster for i in recientes}
        if len(clusters_recientes) == 1:
            cluster_nuevo = list(clusters_recientes)[0]
            puntos_pasado = sum(1 for i in historicas if i.producto.cluster == cluster_nuevo)
            if puntos_pasado < len(historicas) * 0.1:
                reset_historial = True

    interacciones_data = []
    for i, inter in enumerate(interacciones_qs):
        if reset_historial and i >= 5:
            peso_temporal = 0.01
        else:
            peso_temporal = 5 if i < 10 else 1
        valor_accion = 10 if inter.tipo == 'COMPRA' else 1
        interacciones_data.append({
            'producto_id': inter.producto_id,
            'nombre': inter.producto.nombre,
            'puntos': valor_accion * peso_temporal,
            'cluster': inter.producto.cluster
        })

    df_user = pd.DataFrame(interacciones_data)
    productos_vistos_nombres = set(df_user['nombre'].unique())

    # 3. Identificar Clústeres dominantes
    top_clusters = df_user.groupby('cluster')['puntos'].sum().sort_values(ascending=False)
    clusters_interes = top_clusters.index.tolist()

    # 4. Generación de Pool de Candidatos Dinámico
    final_recs = []
    nombres_agregados = set()

    # Función auxiliar para agregar productos únicos por nombre
    def agregar_productos(queryset, cupo):
        agregados = 0
        for p in queryset.order_by('?'): # Aleatoriedad interna
            if agregados >= cupo: break
            if p.nombre not in productos_vistos_nombres and p.nombre not in nombres_agregados:
                final_recs.append(p)
                nombres_agregados.add(p.nombre)
                agregados += 1

    if clusters_interes:
        # 60% para el clúster principal (Lo que estás comprando ahora)
        cupo_principal = int(limite * 0.6)
        agregar_productos(Producto.objects.filter(cluster=clusters_interes[0]), cupo_principal)

        # 40% para el resto (Mezcla con otros intereses o descubrimientos)
        cupo_mezcla = limite - len(final_recs)
        if len(clusters_interes) > 1:
            # Mezcla con el segundo clúster más importante
            agregar_productos(Producto.objects.filter(cluster=clusters_interes[1]), cupo_mezcla)
        else:
            # Si no hay más intereses, sugerir algo nuevo para forzar descubrimiento
            agregar_productos(Producto.objects.exclude(cluster=clusters_interes[0]), cupo_mezcla)

    # Rellenar si falta algo
    if len(final_recs) < limite:
        agregar_productos(Producto.objects.all(), limite - len(final_recs))

    return final_recs[:limite]