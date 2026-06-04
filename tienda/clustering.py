import pandas as pd
from sklearn.cluster import KMeans
from sklearn.preprocessing import StandardScaler
from .models import Producto

def ejecutar_clustering(n_clusters=5):
    # 1. Obtener datos de productos
    productos = Producto.objects.all()
    if not productos.exists():
        return "No hay productos para agrupar."

    data = []
    for p in productos:
        data.append({
            'id': p.id,
            'precio': p.precio,
            'categoria_id': p.categoria.id
        })

    df = pd.DataFrame(data)

    # 2. Preprocesamiento (Normalización)
    scaler = StandardScaler()
    features = df[['precio', 'categoria_id']]
    features_scaled = scaler.fit_transform(features)

    # 3. Aplicar K-Means
    kmeans = KMeans(n_clusters=n_clusters, random_state=42, n_init=10)
    df['cluster'] = kmeans.fit_predict(features_scaled)

    # 4. Guardar resultados en la base de datos
    for _, row in df.iterrows():
        Producto.objects.filter(id=row['id']).update(cluster=row['cluster'])

    return f"Clustering completado. {len(df)} productos agrupados en {n_clusters} clústeres."
