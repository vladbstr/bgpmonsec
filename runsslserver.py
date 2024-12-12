from django.core.management.commands.runserver import Command as RunserverCommand

class Command(RunserverCommand):
    def add_arguments(self, parser):
        super().add_arguments(parser)
        parser.add_argument(
            '--cert',
            default='D:/MASTER/Proiect_disertatie/bgpmmonsec/certs/bgpmonsec.cert',
            help='Path to the SSL certificate'
        )
        parser.add_argument(
            '--key',
            default='D:/MASTER/Proiect_disertatie/bgpmmonsec/certs/bgpmonsec.key',
            help='Path to the SSL key'
        )
