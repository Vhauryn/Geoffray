import 'package:geoffrey/hooks.dart'
    show useCreateHttpServer, useRequestHandler, HttpServer, useGet;

Future<void> main() async {
  // Creates and returns a new HttpServer and binds it to the given host:port
  // You can do anything with the new server instance
  // HttpServer is the original low level Dart API!
  HttpServer server = await useCreateHttpServer('localhost', 8080);

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
        world
      </span>
    </h1>
  ''';

  useGet(route: '/home', handleRequest: (req, res, _) => res.write(htmlString));
}
