from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
from reportlab.lib import colors
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.platypus import SimpleDocTemplate, Table, TableStyle, Paragraph, Spacer
from django.utils import timezone
import io

def generar_pdf_inventario(kpis, productos_bajo_stock, top_ventas):
    buffer = io.BytesIO()
    doc = SimpleDocTemplate(buffer, pagesize=letter)
    elements = []
    styles = getSampleStyleSheet()

    # Título
    elements.append(Paragraph("REPORTE INTELIGENTE DE ALMACÉN - MI FERRETERÍA", styles['Title']))
    elements.append(Paragraph(f"Fecha de generación: {timezone.now().strftime('%d/%m/%Y %H:%M')}", styles['Normal']))
    elements.append(Spacer(1, 20))

    # Sección KPIs
    elements.append(Paragraph("Resumen de Salud del Inventario:", styles['Heading2']))
    elements.append(Paragraph(f"Total de Productos: {kpis['total_productos']}", styles['Normal']))
    elements.append(Paragraph(f"Productos Críticos (Bajo Stock): {kpis['productos_criticos']}", styles['Normal']))
    elements.append(Paragraph(f"Salud del Inventario: {kpis['salud']}%", styles['Normal']))
    elements.append(Paragraph(f"Productos sin Movimiento: {kpis['sin_movimiento']}", styles['Normal']))
    elements.append(Spacer(1, 20))

    # Tabla de Productos Críticos
    if productos_bajo_stock:
        elements.append(Paragraph("PRODUCTOS QUE REQUIEREN RESURTIDO URGENTE:", styles['Heading3']))
        data = [["Producto", "Stock Actual", "Categoría"]]
        for p in productos_bajo_stock:
            if p['estado'] == 'Crítico':
                data.append([p['producto'], p['stock'], p['categoria']])
        
        t = Table(data)
        t.setStyle(TableStyle([
            ('BACKGROUND', (0, 0), (-1, 0), colors.red),
            ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
            ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
            ('GRID', (0, 0), (-1, -1), 1, colors.black)
        ]))
        elements.append(t)
        elements.append(Spacer(1, 20))

    # Tabla de Top Ventas
    if top_ventas:
        elements.append(Paragraph("TOP PRODUCTOS MÁS VENDIDOS:", styles['Heading3']))
        data = [["Producto", "Unidades", "Ingresos"]]
        for p in top_ventas:
            data.append([p['nombre'], p['unidades_vendidas'], f"${p['ingresos']:.2f}"])
        
        t = Table(data)
        t.setStyle(TableStyle([
            ('BACKGROUND', (0, 0), (-1, 0), colors.blue),
            ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
            ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
            ('GRID', (0, 0), (-1, -1), 1, colors.black)
        ]))
        elements.append(t)

    doc.build(elements)
    buffer.seek(0)
    return buffer

def generar_ticket_resurtido(producto, cantidad_comprada, nuevo_stock):
    buffer = io.BytesIO()
    p = canvas.Canvas(buffer, pagesize=(300, 400)) # Tamaño tipo ticket
    ahora = timezone.now()
    folio = ahora.strftime("%Y%m%d%H%M%S")

    # Diseño del Ticket
    p.setFont("Helvetica-Bold", 14)
    p.drawCentredString(150, 370, "TICKET DE RESURTIDO")
    p.setFont("Helvetica", 10)
    p.drawCentredString(150, 355, "MI FERRETERÍA - CONTROL DE STOCK")
    
    p.line(20, 345, 280, 345)
    
    p.drawString(30, 320, f"FOLIO: {folio}")
    p.drawString(30, 305, f"FECHA: {ahora.strftime('%d/%m/%Y %H:%M')}")
    
    p.line(20, 295, 280, 295)
    
    p.setFont("Helvetica-Bold", 11)
    p.drawString(30, 270, "DETALLE DE OPERACIÓN:")
    p.setFont("Helvetica", 10)
    p.drawString(30, 250, f"PRODUCTO: {producto.nombre}")
    p.drawString(30, 235, f"CATEGORÍA: {producto.categoria.nombre}")
    
    p.setFont("Helvetica-Bold", 12)
    p.drawString(30, 200, f"CANTIDAD COMPRADA: +{cantidad_comprada}")
    p.line(20, 190, 280, 190)
    
    p.setFont("Helvetica-Bold", 11)
    p.drawString(30, 160, f"NUEVO TOTAL EN STOCK: {nuevo_stock}")
    
    p.setFont("Helvetica-Oblique", 8)
    p.drawCentredString(150, 50, "Documento interno de almacén.")
    p.drawCentredString(150, 40, "Actualización de inventario autorizada.")

    p.showPage()
    p.save()
    buffer.seek(0)
    return buffer
