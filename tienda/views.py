from django.shortcuts import render, redirect, get_object_or_404
from django.db.models import Q, Sum
from django.core.paginator import Paginator
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.utils import timezone
from .models import Producto, Carrito, ItemCarrito, Orden, DetalleOrden, Interaccion
from .recommender import recomendaciones_hibridas
from django.contrib.auth import login, authenticate, logout
from .forms import RegistroForm
from .analytics import (
    generar_grafico_clusters, 
    generar_grafico_preferencias, 
    segmentar_clientes_ia, 
    generar_grafico_segmentacion,
    obtener_ventas_categoria,
    obtener_rotacion_productos,
    predecir_ventas_futuras,
    generar_grafico_ventas_categoria,
    obtener_kpis_inventario,
    obtener_lista_inventario,
    generar_grafico_inventario,
    obtener_metricas_financieras_mxn,
    obtener_comparativas_financieras,
    obtener_analitica_operaciones,
    obtener_clasificaciones_empresa,
    obtener_prioridad_resurtido,
    generar_sparkline_movimiento,
    generar_grafico_dona_clientes,
    generar_grafico_balance_mensual
)
from .utils import generar_pdf_inventario, generar_ticket_resurtido
from django.http import HttpResponse


def landing(request):
    productos = Producto.objects.all()[:4]
    return render(request, 'landing.html', {'productos': productos})


def dashboard(request):
    productos_list = Producto.objects.all().order_by('id')
    paginator = Paginator(productos_list, 15)
    page_number = request.GET.get('page')
    productos = paginator.get_page(page_number)

    recomendaciones = []
    if request.user.is_authenticated:
        recomendaciones = recomendaciones_hibridas(request.user.id)

    return render(request, 'dashboard.html', {
        'productos': productos,
        'recomendaciones': recomendaciones
    })


@login_required
def agregar_carrito(request, producto_id):
    carrito, _ = Carrito.objects.get_or_create(usuario=request.user)

    item, created = ItemCarrito.objects.get_or_create(
        carrito=carrito,
        producto_id=producto_id
    )

    if not created:
        item.cantidad += 1
        item.save()

    # Registrar interacción de interés al agregar al carrito
    Interaccion.objects.create(
        usuario=request.user,
        producto_id=producto_id,
        tipo='VISTA'
    )

    return redirect('carrito')


@login_required
def restar_del_carrito(request, item_id):
    item = ItemCarrito.objects.get(id=item_id, carrito__usuario=request.user)
    if item.cantidad > 1:
        item.cantidad -= 1
        item.save()
    else:
        item.delete()
    return redirect('carrito')


@login_required
def eliminar_del_carrito(request, item_id):
    item = ItemCarrito.objects.get(id=item_id, carrito__usuario=request.user)
    item.delete()
    return redirect('carrito')


@login_required
def carrito(request):
    carrito, _ = Carrito.objects.get_or_create(usuario=request.user)
    items = ItemCarrito.objects.filter(carrito=carrito)

    total = sum(i.producto.precio * i.cantidad for i in items)

    return render(request, 'carrito.html', {
        'items': items,
        'total': total
    })


def registro(request):
    if request.method == 'POST':
        form = RegistroForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.set_password(form.cleaned_data['password'])
            user.save()
            login(request, user)
            return redirect('dashboard')
    else:
        form = RegistroForm()

    return render(request, 'registro.html', {'form': form})


def login_view(request):
    if request.method == 'POST':
        user = authenticate(
            username=request.POST['username'],
            password=request.POST['password']
        )
        if user:
            login(request, user)
            return redirect('dashboard')

    return render(request, 'login.html')


def logout_view(request):
    logout(request)
    return redirect('landing')


def buscar(request):
    query = request.GET.get('q', '')
    
    if query:
        resultados_list = Producto.objects.filter(
            Q(nombre__icontains=query) |
            Q(categoria__nombre__icontains=query) |
            Q(descripcion__icontains=query)
        ).distinct().order_by('id')
    else:
        resultados_list = Producto.objects.none()

    paginator = Paginator(resultados_list, 15)
    page_number = request.GET.get('page')
    resultados = paginator.get_page(page_number)

    return render(request, 'busqueda.html', {
        'resultados': resultados,
        'query': query
    })


@login_required
def checkout(request):
    carrito = Carrito.objects.get(usuario=request.user)
    items = ItemCarrito.objects.filter(carrito=carrito)

    if not items:
        return redirect('dashboard')

    # 1. VALIDACIÓN DE EXISTENCIAS (Paso 1.2)
    for item in items:
        if item.producto.stock < item.cantidad:
            messages.error(request, f"Lo sentimos, no hay suficiente stock de {item.producto.nombre} (Disponibles: {item.producto.stock}).")
            return redirect('carrito')

    total = sum(i.producto.precio * i.cantidad for i in items)

    orden = Orden.objects.create(usuario=request.user, total=total)

    for item in items:
        # 1. Descontar del Inventario Real
        item.producto.stock -= item.cantidad
        item.producto.save()

        # 2. Registrar detalle de la orden
        DetalleOrden.objects.create(
            orden=orden,
            producto=item.producto,
            cantidad=item.cantidad
        )

        # registrar interacción
        Interaccion.objects.create(
            usuario=request.user,
            producto=item.producto,
            tipo='COMPRA'
        )

    items.delete()

    return redirect('ver_recibo', orden_id=orden.id)


@login_required
def ver_recibo(request, orden_id):
    orden = get_object_or_404(Orden, id=orden_id, usuario=request.user)
    detalles = DetalleOrden.objects.filter(orden=orden)
    return render(request, 'recibo.html', {
        'orden': orden,
        'detalles': detalles
    })


@login_required
def historial_compras(request):
    ordenes = Orden.objects.filter(usuario=request.user).order_by('-fecha')
    return render(request, 'historial.html', {'ordenes': ordenes})


def detalle_producto(request, producto_id):
    producto = get_object_or_404(Producto, id=producto_id)
    
    # Registrar interacción de vista si el usuario está autenticado
    if request.user.is_authenticated:
        Interaccion.objects.create(
            usuario=request.user,
            producto=producto,
            tipo='VISTA'
        )
    
    return render(request, 'detalle.html', {'producto': producto})


@login_required
def analitica(request):
    # Obtener historial de compras simple
    ordenes = Orden.objects.filter(usuario=request.user).order_by('-fecha')

    # Generar gráficos actualizados
    grafico_clusters = generar_grafico_clusters()
    grafico_usuario = generar_grafico_preferencias(request.user)

    return render(request, 'analitica.html', {
        'ordenes': ordenes,
        'grafico_clusters': grafico_clusters,
        'grafico_usuario': grafico_usuario
    })

@login_required
def reporte_clientes(request):
    # Restricción estricta: Solo el usuario 'heli' puede acceder
    if request.user.username != 'admin':
        return redirect('dashboard')

    # 1. Obtener la segmentación por IA
    clientes = segmentar_clientes_ia()
    
    # 2. Generar la gráfica automática
    grafica_url = generar_grafico_segmentacion()

    # 3. Calcular métricas para las tarjetas de resumen
    resumen = {
        'total_clientes': len(clientes),
        'premium': len([c for c in clientes if c['categoria'] == 'Clientes Premium']),
        'ocasionales': len([c for c in clientes if c['categoria'] == 'Clientes Ocasionales']),
        'inactivos': len([c for c in clientes if c['categoria'] == 'Clientes Inactivos']),
    }

    return render(request, 'reporte_clientes.html', {
        'clientes': clientes,
        'grafica_url': grafica_url,
        'resumen': resumen
    })

@login_required
def reporte_ventas(request):
    # Restricción: Solo el usuario 'heli'
    if request.user.username != 'admin':
        return redirect('dashboard')

    # 1. Obtener datos de ventas y rotación
    ventas_cat = obtener_ventas_categoria().to_dict('records')
    rotacion = obtener_rotacion_productos()
    
    # 2. Obtener predicción por IA
    prediccion = predecir_ventas_futuras()

    # 3. Generar gráfica de ventas
    grafica_ventas_url = generar_grafico_ventas_categoria()

    return render(request, 'reporte_ventas.html', {
        'ventas_cat': ventas_cat,
        'top_productos': rotacion['top'],
        'bottom_productos': rotacion['bottom'],
        'prediccion': prediccion,
        'grafica_ventas_url': grafica_ventas_url
    })

@login_required
def reporte_almacen(request):
    if request.user.username != 'admin':
        return redirect('dashboard')

    kpis = obtener_kpis_inventario()
    inventario = obtener_lista_inventario()
    grafica_url = generar_grafico_inventario()

    return render(request, 'reporte_almacen.html', {
        'kpis': kpis,
        'inventario': inventario,
        'grafica_url': grafica_url
    })

@login_required
def descargar_reporte_pdf(request):
    if request.user.username != 'admin':
        return redirect('dashboard')

    kpis = obtener_kpis_inventario()
    inventario = obtener_lista_inventario()
    rotacion = obtener_rotacion_productos()
    
    pdf_buffer = generar_pdf_inventario(kpis, inventario, rotacion['top'])
    
    response = HttpResponse(pdf_buffer, content_type='application/pdf')
    response['Content-Disposition'] = 'attachment; filename="Reporte_Inteligente_Almacen.pdf"'
    return response

@login_required
def dashboard_empresa(request):
    if request.user.username != 'admin':
        return redirect('dashboard')

    # 1. Obtener datos de IA y Analítica
    metricas = obtener_metricas_financieras_mxn()
    comparativas = obtener_comparativas_financieras()
    operaciones = obtener_analitica_operaciones()
    clasificaciones = obtener_clasificaciones_empresa()
    prioridad_resurtido = obtener_prioridad_resurtido()
    
    # 2. Lógica para la tabla de inventario del Apartado 3
    inventario_raw = obtener_lista_inventario()
    inventario_detallado = []
    hace_28d = timezone.now() - timezone.timedelta(days=28)
    
    for p in inventario_raw:
        # Calcular porcentaje de stock (asumiendo 50 como stock máximo deseado para el KPI visual)
        p['porcentaje_stock'] = min(100, round((p['stock'] / 50) * 100))
        
        # VENTAS REALES ÚLTIMAS 4 SEMANAS (Ajustado para mayor precisión)
        ventas_reales = DetalleOrden.objects.filter(
            producto_id=p['id'],
            orden__fecha__gte=hace_28d
        ).aggregate(t=Sum('cantidad'))['t'] or 0
        
        p['ventas_recientes'] = ventas_reales
        inventario_detallado.append(p)

    # 3. Generar Gráficos
    sparkline_url = generar_sparkline_movimiento()
    dona_url = generar_grafico_dona_clientes()
    balance_url = generar_grafico_balance_mensual()

    return render(request, 'reporte_empresa.html', {
        'metricas': metricas,
        'comparativas': comparativas,
        'operaciones': operaciones,
        'clasificaciones': clasificaciones,
        'prioridad_resurtido': prioridad_resurtido,
        'inventario_detallado': inventario_detallado[:10],
        'sparkline_url': sparkline_url,
        'dona_url': dona_url,
        'balance_url': balance_url
    })

@login_required
def resurtir_producto(request, producto_id):
    if request.user.username != 'admin':
        return redirect('dashboard')
    
    producto = get_object_or_404(Producto, id=producto_id)
    
    if request.method == 'POST':
        cantidad = int(request.POST.get('cantidad', 0))
        if cantidad > 0:
            # 1. Actualizar Stock
            producto.stock += cantidad
            producto.save()
            
            # 2. Generar Ticket PDF
            pdf_buffer = generar_ticket_resurtido(producto, cantidad, producto.stock)
            
            # 3. Entregar PDF (El redireccionamiento se manejará en el frontend para permitir la descarga)
            response = HttpResponse(pdf_buffer, content_type='application/pdf')
            response['Content-Disposition'] = f'attachment; filename="Ticket_Resurtido_{producto.id}.pdf"'
            return response

    return render(request, 'resurtir_producto.html', {
        'producto': producto
    })