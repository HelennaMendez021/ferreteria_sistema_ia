import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import pandas as pd
import os
import numpy as np
from django.conf import settings
from .models import Producto, Interaccion, Orden, DetalleOrden
from django.contrib.auth.models import User
from django.db.models import Sum, Count, Max, F
from django.utils import timezone
from sklearn.cluster import KMeans
from sklearn.linear_model import LinearRegression

# --- FUNCIONES AUXILIARES ---

def get_cat_icon(cat_name):
    cat = cat_name.lower()
    if 'electr' in cat: return '⚡'
    if 'herram' in cat: return '🛠️'
    if 'segurid' in cat: return '🛡️'
    if 'pintur' in cat: return '🎨'
    if 'ferret' in cat or 'tornil' in cat: return '🔩'
    if 'plomer' in cat or 'constru' in cat: return '🏗️'
    return '📦'

# --- FUNCIONES DE CLIENTES ---

def obtener_datos_clientes():
    clientes_data = User.objects.annotate(
        total_gastado=Sum('orden__total'),
        frecuencia=Count('orden'),
        ultima_compra=Max('orden__fecha')
    ).values('username', 'total_gastado', 'frecuencia', 'ultima_compra')

    df = pd.DataFrame(list(clientes_data))
    df['total_gastado'] = df['total_gastado'].fillna(0)
    df['frecuencia'] = df['frecuencia'].fillna(0)
    
    ahora = timezone.now()
    def calcular_recencia(fecha):
        if pd.isna(fecha):
            return 999
        return (ahora - fecha).days

    df['recencia'] = df['ultima_compra'].apply(calcular_recencia)
    return df

def segmentar_clientes_ia():
    df = obtener_datos_clientes()
    if df.empty or len(df) < 3:
        return []

    X = df[['total_gastado', 'frecuencia', 'recencia']]
    kmeans = KMeans(n_clusters=3, random_state=42, n_init=10)
    df['cluster_id'] = kmeans.fit_predict(X)

    centros = df.groupby('cluster_id')['total_gastado'].mean().sort_values(ascending=False)
    nombres_clusters = {
        centros.index[0]: 'Clientes Premium',
        centros.index[1]: 'Clientes Ocasionales',
        centros.index[2]: 'Clientes Inactivos'
    }
    df['categoria'] = df['cluster_id'].map(nombres_clusters)
    return df.to_dict('records')

def generar_grafico_segmentacion():
    data = segmentar_clientes_ia()
    if not data: return None
    df = pd.DataFrame(data)

    plt.figure(figsize=(10, 6))
    colores = {'Clientes Premium': 'green', 'Clientes Ocasionales': 'orange', 'Clientes Inactivos': 'red'}
    for cat, color in colores.items():
        subset = df[df['categoria'] == cat]
        plt.scatter(subset['frecuencia'], subset['total_gastado'], c=color, label=cat, s=100, alpha=0.6, edgecolors='black')

    plt.title('Segmentación de Clientes: Gasto vs Frecuencia')
    plt.xlabel('Número de Compras (Frecuencia)')
    plt.ylabel('Total Gastado ($)')
    plt.legend()
    plt.grid(True, linestyle='--', alpha=0.5)

    path = os.path.join(settings.BASE_DIR, 'tienda/static/charts/segmentacion_clientes.png')
    os.makedirs(os.path.dirname(path), exist_ok=True)
    plt.savefig(path)
    plt.close()
    return 'charts/segmentacion_clientes.png'

# --- NUEVAS FUNCIONES DE VENTAS Y PREDICCIÓN ---

def obtener_ventas_categoria():
    ventas = DetalleOrden.objects.values(
        nombre=F('producto__categoria__nombre')
    ).annotate(
        total=Sum(F('cantidad') * F('producto__precio'))
    ).order_by('-total')
    return pd.DataFrame(list(ventas))

def obtener_rotacion_productos():
    rotacion = DetalleOrden.objects.values(
        nombre=F('producto__nombre')
    ).annotate(
        unidades_vendidas=Sum('cantidad'),
        ingresos=Sum(F('cantidad') * F('producto__precio'))
    ).order_by('-unidades_vendidas')
    
    df_rotacion = pd.DataFrame(list(rotacion))
    if df_rotacion.empty:
        return { 'top': [], 'bottom': [] }
    
    return {
        'top': df_rotacion.head(5).to_dict('records'),
        'bottom': df_rotacion.tail(5).to_dict('records')
    }

def predecir_ventas_futuras():
    ventas_diarias = Orden.objects.extra(
        select={'dia': 'DATE(fecha)'}
    ).values('dia').annotate(total=Sum('total')).order_by('dia')

    df = pd.DataFrame(list(ventas_diarias))
    if df.empty or len(df) < 2:
        return { 'prediccion': 0, 'tendencia': 'Estable' }

    df['n_dia'] = range(len(df))
    X = df[['n_dia']]
    y = df['total']

    modelo = LinearRegression()
    modelo.fit(X, y)
    proximo_dia = [[len(df)]]
    prediccion = modelo.predict(proximo_dia)[0]

    coeficiente = modelo.coef_[0]
    if coeficiente > 0: tendencia = 'Crecimiento'
    elif coeficiente < 0: tendencia = 'Decrecimiento'
    else: tendencia = 'Estable'

    return {
        'prediccion': round(max(0, prediccion), 2),
        'tendencia': tendencia,
        'crecimiento_diario': round(coeficiente, 2)
    }

# --- FUNCIONES DE ALMACÉN e INVENTARIO ---

def obtener_kpis_inventario():
    total_productos = Producto.objects.count()
    productos_criticos = Producto.objects.filter(stock__lte=10).count()
    vendidos_ids = DetalleOrden.objects.values_list('producto_id', flat=True).distinct()
    productos_sin_movimiento = Producto.objects.exclude(id__in=vendidos_ids).count()
    
    if total_productos > 0:
        salud = round(((total_productos - productos_criticos) / total_productos) * 100, 2)
    else:
        salud = 0

    return {'total_productos': total_productos, 'productos_criticos': productos_criticos, 'salud': salud, 'sin_movimiento': productos_sin_movimiento}

def obtener_lista_inventario():
    # Ordenar por stock ascendente para prioridad
    productos = Producto.objects.all().order_by('stock').values('id', 'nombre', 'stock', 'categoria__nombre')
    
    data = []
    for p in productos:
        if p['stock'] <= 10:
            estado, color = 'Crítico', 'red'
        elif p['stock'] < 25:
            estado, color = 'Aceptable', 'yellow'
        else:
            estado, color = 'Saludable', 'green'
            
        data.append({
            'id': p['id'],
            'producto': p['nombre'],
            'stock': p['stock'],
            'categoria': p['categoria__nombre'],
            'estado': estado,
            'color': color,
            'icono': get_cat_icon(p['categoria__nombre']) # Icono dinámico
        })
    return data

def generar_grafico_inventario():
    inventario = Producto.objects.values(cat=F('categoria__nombre')).annotate(stock_total=Sum('stock')).order_by('-stock_total')
    df = pd.DataFrame(list(inventario))
    if df.empty: return None

    plt.figure(figsize=(10, 6))
    plt.bar(df['cat'], df['stock_total'], color='teal', edgecolor='black')
    plt.title('Nivel de Stock por Categoría')
    plt.xlabel('Categoría'); plt.ylabel('Cantidad en Almacén')
    plt.xticks(rotation=45); plt.tight_layout()

    path = os.path.join(settings.BASE_DIR, 'tienda/static/charts/stock_inventario.png')
    plt.savefig(path); plt.close()
    return 'charts/stock_inventario.png'

# --- FUNCIONES DASHBOARD EMPRESA ---

def obtener_metricas_financieras_mxn():
    ahora = timezone.now()
    hace_24h = ahora - timezone.timedelta(days=1)
    hace_7d = ahora - timezone.timedelta(days=7)
    hace_30d = ahora - timezone.timedelta(days=30)
    
    ingreso_dia = Orden.objects.filter(fecha__gte=hace_24h).aggregate(t=Sum('total'))['t'] or 0
    ingreso_semana = Orden.objects.filter(fecha__gte=hace_7d).aggregate(t=Sum('total'))['t'] or 0
    ingreso_mes = Orden.objects.filter(fecha__gte=hace_30d).aggregate(t=Sum('total'))['t'] or 0
    
    return {'hoy': round(ingreso_dia, 2), 'semana': round(ingreso_semana, 2), 'mes': round(ingreso_mes, 2)}

def obtener_comparativas_financieras():
    ahora = timezone.now()
    hace_7d, hace_30d = ahora - timezone.timedelta(days=7), ahora - timezone.timedelta(days=30)
    hace_14d, hace_60d = ahora - timezone.timedelta(days=14), ahora - timezone.timedelta(days=60)
    
    ingreso_semana = Orden.objects.filter(fecha__gte=hace_7d).aggregate(t=Sum('total'))['t'] or 0
    ingreso_mes = Orden.objects.filter(fecha__gte=hace_30d).aggregate(t=Sum('total'))['t'] or 0
    prev_semana = Orden.objects.filter(fecha__gte=hace_14d, fecha__lt=hace_7d).aggregate(t=Sum('total'))['t'] or 0
    prev_mes = Orden.objects.filter(fecha__gte=hace_60d, fecha__lt=hace_30d).aggregate(t=Sum('total'))['t'] or 0
    
    def calc_var(actual, anterior):
        if anterior == 0: return 100.0 if actual > 0 else 0.0
        return round(((actual - anterior) / anterior) * 100, 2)
    
    return {'var_semana': calc_var(ingreso_semana, prev_semana), 'var_mes': calc_var(ingreso_mes, prev_mes)}

def obtener_analitica_operaciones():
    recurrentes = DetalleOrden.objects.values('orden__usuario').annotate(veces=Count('id')).filter(veces__gt=1).count()
    total_interacciones = Interaccion.objects.count()
    total_compras = Orden.objects.count()
    tasa_conversion = round((total_compras / total_interacciones) * 100, 2) if total_interacciones > 0 else 0.0
    cat_movimiento = DetalleOrden.objects.values(nombre=F('producto__categoria__nombre')).annotate(cantidad=Sum('cantidad')).order_by('-cantidad').first()
    return {'pedidos_frecuentes': recurrentes, 'tasa_conversion': tasa_conversion, 'categoria_movimiento': cat_movimiento['nombre'] if cat_movimiento else 'N/A'}

def obtener_clasificaciones_empresa():
    mejores_clientes = User.objects.annotate(total_acumulado=Sum('orden__total')).order_by('-total_acumulado')[:4]
    
    productos_top_raw = DetalleOrden.objects.values('producto__nombre', 'producto__categoria__nombre').annotate(volumen=Sum('cantidad')).order_by('-volumen')[:5]
    productos_top = []
    for p in productos_top_raw:
        p['icono'] = get_cat_icon(p['producto__categoria__nombre'])
        productos_top.append(p)
    
    productos_alerta_raw = DetalleOrden.objects.values('producto__nombre', 'producto__categoria__nombre').annotate(volumen=Sum('cantidad')).order_by('volumen')[:2]
    productos_alerta = []
    for p in productos_alerta_raw:
        p['icono'] = get_cat_icon(p['producto__categoria__nombre'])
        productos_alerta.append(p)

    return {'clientes_vip': mejores_clientes, 'productos_top': productos_top, 'productos_alerta': productos_alerta}

def obtener_prioridad_resurtido():
    # 1. Identificar productos con Stock <= 10 (Riesgo de agotarse)
    # 2. Ordenarlos por su volumen de ventas RECIENTE (últimos 30 días)
    
    hace_30d = timezone.now() - timezone.timedelta(days=30)
    criticos_ids = Producto.objects.filter(stock__lte=10).values_list('id', flat=True)
    
    # Función auxiliar para iconos (reutilizada)
    def get_cat_icon(cat_name):
        cat = cat_name.lower()
        if 'electr' in cat: return '⚡'
        if 'herram' in cat: return '🛠️'
        if 'segurid' in cat: return '🛡️'
        if 'pintur' in cat: return '🎨'
        if 'ferret' in cat or 'tornil' in cat: return '🔩'
        if 'plomer' in cat or 'constru' in cat: return '🏗️'
        return '📦'

    # Filtrar ventas de productos críticos en el último mes
    prioridad_raw = DetalleOrden.objects.filter(
        producto_id__in=criticos_ids,
        orden__fecha__gte=hace_30d
    ).values(
        'producto_id',
        'producto__nombre',
        'producto__categoria__nombre'
    ).annotate(
        volumen_reciente=Sum('cantidad')
    ).order_by('-volumen_reciente')[:5]
    
    prioridad_resurtido = []
    for p in prioridad_raw:
        p['icono'] = get_cat_icon(p['producto__categoria__nombre'])
        # Mapeamos el nombre del campo para el template
        p['volumen'] = p['volumen_reciente']
        prioridad_resurtido.append(p)
        
    return prioridad_resurtido

# --- GRÁFICOS DE APOYO ---

def generar_sparkline_movimiento():
    ventas_diarias = Orden.objects.extra(select={'dia': 'DATE(fecha)'}).values('dia').annotate(total=Sum('total')).order_by('dia')[:15]
    df = pd.DataFrame(list(ventas_diarias))
    if df.empty: return None
    plt.figure(figsize=(4, 1.5)); plt.plot(df['total'], color='indigo', linewidth=2)
    plt.fill_between(range(len(df)), df['total'], color='indigo', alpha=0.1); plt.axis('off'); plt.tight_layout(pad=0)
    path = os.path.join(settings.BASE_DIR, 'tienda/static/charts/sparkline_movimiento.png')
    plt.savefig(path, transparent=True); plt.close()
    return 'charts/sparkline_movimiento.png'

def generar_grafico_dona_clientes():
    ventas_cat = DetalleOrden.objects.values(cat=F('producto__categoria__nombre')).annotate(total=Sum(F('cantidad') * F('producto__precio'))).order_by('-total')[:5]
    df = pd.DataFrame(list(ventas_cat))
    if df.empty: return None
    plt.figure(figsize=(6, 6)); plt.pie(df['total'], labels=df['cat'], autopct='%1.1f%%', startangle=90, colors=plt.cm.Paired.colors, wedgeprops={'width': 0.4})
    plt.title('Distribución por Categorías', pad=20); plt.tight_layout()
    path = os.path.join(settings.BASE_DIR, 'tienda/static/charts/dona_clientes.png')
    plt.savefig(path); plt.close()
    return 'charts/dona_clientes.png'

def generar_grafico_balance_mensual():
    ventas_mes = Orden.objects.extra(select={'mes': "DATE_FORMAT(fecha, '%%Y-%%m')"}).values('mes').annotate(total=Sum('total')).order_by('mes')
    df = pd.DataFrame(list(ventas_mes))
    if df.empty: return None
    plt.figure(figsize=(12, 5)); plt.plot(df['mes'], df['total'], color='teal', marker='o', linewidth=3, label='Ingresos MXN')
    plt.fill_between(df['mes'], df['total'], color='teal', alpha=0.2); plt.title('Tendencia de Ingresos Mensuales', pad=15)
    plt.xlabel('Mes'); plt.ylabel('Monto ($)'); plt.grid(True, linestyle='--', alpha=0.3); plt.legend(); plt.tight_layout()
    path = os.path.join(settings.BASE_DIR, 'tienda/static/charts/balance_mensual.png')
    plt.savefig(path); plt.close()
    return 'charts/balance_mensual.png'

def generar_grafico_clusters():
    productos = Producto.objects.all().values('precio', 'categoria_id', 'cluster')
    df = pd.DataFrame(list(productos))
    if df.empty: return None
    plt.figure(figsize=(10, 6)); scatter = plt.scatter(df['categoria_id'], df['precio'], c=df['cluster'], cmap='viridis', s=100, alpha=0.7)
    plt.colorbar(scatter, label='ID de Clúster'); plt.title('Agrupación de Productos por Precio y Categoría (K-Means)')
    plt.xlabel('ID de Categoría'); plt.ylabel('Precio ($)'); plt.grid(True, linestyle='--', alpha=0.6)
    path = os.path.join(settings.BASE_DIR, 'tienda/static/charts/cluster_plot.png')
    plt.savefig(path); plt.close()
    return 'charts/cluster_plot.png'

def generar_grafico_preferencias(usuario):
    interacciones = Interaccion.objects.filter(usuario=usuario).values('producto__categoria__nombre')
    df = pd.DataFrame(list(interacciones))
    if df.empty: return None
    conteo = df['producto__categoria__nombre'].value_counts()
    plt.figure(figsize=(8, 8)); conteo.plot(kind='pie', autopct='%1.1f%%', startangle=140, colors=plt.cm.Paired.colors)
    plt.title(f'Preferencias de {usuario.username} por Categoría'); plt.ylabel('')
    path = os.path.join(settings.BASE_DIR, f'tienda/static/charts/prefs_{usuario.id}.png')
    plt.savefig(path); plt.close()
    return f'charts/prefs_{usuario.id}.png'

def generar_grafico_inventario():
    inventario = Producto.objects.values(cat=F('categoria__nombre')).annotate(stock_total=Sum('stock')).order_by('-stock_total')
    df = pd.DataFrame(list(inventario))
    if df.empty: return None
    plt.figure(figsize=(10, 6)); plt.bar(df['cat'], df['stock_total'], color='teal', edgecolor='black')
    plt.title('Nivel de Stock por Categoría'); plt.xlabel('Categoría'); plt.ylabel('Cantidad en Almacén'); plt.xticks(rotation=45); plt.tight_layout()
    path = os.path.join(settings.BASE_DIR, 'tienda/static/charts/stock_inventario.png')
    plt.savefig(path); plt.close()
    return 'charts/stock_inventario.png'

def generar_grafico_ventas_categoria():
    df = obtener_ventas_categoria()
    if df.empty: return None
    plt.figure(figsize=(10, 6)); plt.bar(df['nombre'], df['total'], color='skyblue', edgecolor='navy')
    plt.title('Ventas Totales por Categoría'); plt.xlabel('Categoría'); plt.ylabel('Ingresos ($)'); plt.xticks(rotation=45); plt.grid(axis='y', linestyle='--', alpha=0.7); plt.tight_layout()
    path = os.path.join(settings.BASE_DIR, 'tienda/static/charts/ventas_categoria.png')
    plt.savefig(path); plt.close()
    return 'charts/ventas_categoria.png'
