from django.core.management.commands.runserver import Command as RunserverCommand
import ssl


class Command(RunserverCommand):
    def add_arguments(self, parser):
        # Adaugă argumentele originale ale `runserver`
        super().add_arguments(parser)

        # Adaugă opțiuni pentru certificatul SSL și cheia privată
        parser.add_argument(
            '--certificate',
            default='certs/bgpmonsec.crt',
            help='Path to the SSL certificate'
        )
        parser.add_argument(
            '--key',
            default='certs/bgpmonsec.key',
            help='Path to the SSL key'
        )

    def handle(self, *args, **options):
        # Prelucrează IP-ul și portul implicit
        addrport = options.get('addrport', '0.0.0.0:443')

        # Obține calea certificatului și a cheii
        certificate = options.get('certificate', 'certs/bgpmonsec.crt')
        key = options.get('key', 'certs/bgpmonsec.key')

        # Configurare SSL
        if certificate and key:
            self.stdout.write(
                f"Starting HTTPS server at https://{addrport} with SSL certificate: {certificate} and key: {key}"
            )
            ssl_context = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
            ssl_context.load_cert_chain(certfile=certificate, keyfile=key)

            # Configurează contextul SSL pentru server
            self.extra_options = {'ssl_context': ssl_context}
        else:
            raise RuntimeError("Both --certificate and --key must be provided to run with HTTPS")

        # Apelăm comanda `runserver` standard cu opțiuni suplimentare
        super().handle(*args, **options)
