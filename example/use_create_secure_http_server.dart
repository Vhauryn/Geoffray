import 'package:geoffrey/hooks.dart'
    show useCreateSecureHttpServer, useCertificates, useRequestHandler, useGet;

Future<void> main() async {
  // Creates and returns a new HttpServer and bindSecures it to the given host:port
  // You can do anything with the new server instance
  // HttpServer is the original low level Dart API!
  final sctx = useCertificates(certificate: 'cert.pem', privateKey: 'key.pem');
  final server = await useCreateSecureHttpServer('localhost', 443, sctx);

  // Easy fall back in case hooks are missing some desired functionality
  // If there's something missing please open an issue on GitHub
  server.defaultResponseHeaders.add('x-powered-by', 'hooksMagic');
  server.defaultResponseHeaders.add('content-type', 'text/html');

  // Handles incomming requests
  useRequestHandler(server);

  // yeah Dart XML (aka JSX) would be awesome!
  const String htmlString = ''' 
    <h1>
      <span style="color:green">
        hallo
      </span>
      <span style="color:blue">
        secure
      </span>
    </h1>
  ''';

  useGet(route: '/home', handleRequest: (req, res) => res.write(htmlString));
}
