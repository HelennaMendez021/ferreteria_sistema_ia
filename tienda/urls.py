from django.urls import path
from . import views
from .api import productos_api

urlpatterns = [
    path('', views.landing, name='landing'),
    path('dashboard/', views.dashboard, name='dashboard'),
    path('carrito/', views.carrito, name='carrito'),
    path('agregar/<int:producto_id>/', views.agregar_carrito, name='agregar_carrito'),
    path('restar/<int:item_id>/', views.restar_del_carrito, name='restar_del_carrito'),
    path('eliminar/<int:item_id>/', views.eliminar_del_carrito, name='eliminar_del_carrito'),
    path('login/', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),
    path('registro/', views.registro, name='registro'),
    path('buscar/', views.buscar, name='buscar'),
    path('checkout/', views.checkout, name='checkout'),
    path('recibo/<int:orden_id>/', views.ver_recibo, name='ver_recibo'),
    path('historial/', views.historial_compras, name='historial_compras'),
    path('analitica/', views.analitica, name='analitica'),
    path('producto/<int:producto_id>/', views.detalle_producto, name='detalle_producto'),
    path('reporte-clientes/', views.reporte_clientes, name='reporte_clientes'),
    path('reporte-ventas/', views.reporte_ventas, name='reporte_ventas'),
    path('reporte-almacen/', views.reporte_almacen, name='reporte_almacen'),
    path('reporte-empresa/', views.dashboard_empresa, name='reporte_empresa'),
    path('resurtir-producto/<int:producto_id>/', views.resurtir_producto, name='resurtir_producto'),
    path('reporte-pdf/', views.descargar_reporte_pdf, name='reporte_pdf'),
    path('api/productos/', productos_api, name='api_productos'),
]