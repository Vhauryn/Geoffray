import 'package:geoffrey/hooks.dart'
    show useSecureHttpServer, useSecurityContext, useGet;

void main() {
  final sctx =
      useSecurityContext(certificate: 'cert.pem', privateKey: 'key.pem');

  // creates a new HttpServer, secure binds it to the given
  // host:port and handles incoming requests
  useSecureHttpServer('localhost', 443, sctx);

  // creates a new route with GET method
  // or if route exists appends a new method to it.
  // overrides the method if it already exists.
  // handleGuard is optional and must return a boolean!
  useGet(
      route: '/home',
      handleRequest: (req, res) => res.write('hallo "secure" world'),
      handleGuard: (req, res) => true); // optional
}
