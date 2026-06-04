from django.db import models
from django.contrib.auth.models import User


class Categoria(models.Model):
    nombre = models.CharField(max_length=100)

    def __str__(self):
        return self.nombre


class Producto(models.Model):
    nombre = models.CharField(max_length=200)
    categoria = models.ForeignKey(Categoria, on_delete=models.CASCADE)
    precio = models.FloatField()
    descripcion = models.TextField()
    stock = models.IntegerField()
    cluster = models.IntegerField(default=0)

    def __str__(self):
        return self.nombre

    def get_icon_data(self):
        nombre = self.nombre.lower()
        
        # Mapeo de palabras clave a iconos y colores
        mapeo = [
            (['eléctrico', 'voltaje', 'cinta aislante', 'multímetro', 'cable', 'enchufe', 'foco'], {'icon': '⚡', 'bg': 'bg-yellow-100', 'text': 'text-yellow-600'}),
            (['martillo', 'destornillador', 'llave', 'pinza', 'herramienta', 'taladro', 'sierra'], {'icon': '🛠️', 'bg': 'bg-blue-100', 'text': 'text-blue-600'}),
            (['seguridad', 'casco', 'extintor', 'guante', 'lentes', 'chaleco', 'botas'], {'icon': '🛡️', 'bg': 'bg-red-100', 'text': 'text-red-600'}),
            (['pintura', 'rodillo', 'brocha', 'thinner', 'cubeta', 'barniz'], {'icon': '🎨', 'bg': 'bg-green-100', 'text': 'text-green-600'}),
            (['bisagra', 'clavo', 'tornillo', 'candado', 'herraje', 'manija'], {'icon': '🔩', 'bg': 'bg-slate-100', 'text': 'text-slate-600'}),
            (['tubo', 'pvc', 'cemento', 'yeso', 'ladrillo'], {'icon': '🏗️', 'bg': 'bg-orange-100', 'text': 'text-orange-600'}),
        ]

        for palabras, data in mapeo:
            if any(p in nombre for p in palabras):
                return data
        
        # Icono por defecto (Herramientas)
        return {'icon': '🛠️', 'bg': 'bg-blue-100', 'text': 'text-blue-600'}


class Carrito(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    creado = models.DateTimeField(auto_now_add=True)


class ItemCarrito(models.Model):
    carrito = models.ForeignKey(Carrito, on_delete=models.CASCADE)
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    cantidad = models.IntegerField(default=1)


class Orden(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    total = models.FloatField()
    fecha = models.DateTimeField(auto_now_add=True)


class DetalleOrden(models.Model):
    orden = models.ForeignKey(Orden, on_delete=models.CASCADE)
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    cantidad = models.IntegerField()


class Interaccion(models.Model):
    TIPOS = (
        ('VISTA', 'Vista'),
        ('COMPRA', 'Compra')
    )
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    tipo = models.CharField(max_length=10, choices=TIPOS)