from django.core.management.base import BaseCommand
from tienda.clustering import ejecutar_clustering

class Command(BaseCommand):
    help = 'Agrupa los productos en clústeres usando K-Means'

    def handle(self, *args, **options):
        self.stdout.write(self.style.SUCCESS('Iniciando proceso de clustering...'))
        resultado = ejecutar_clustering(n_clusters=5)
        self.stdout.write(self.style.SUCCESS(resultado))
