import 'package:geoffrey/hooks.dart'
    show useSecureHttpServer, useSecurityContext, SecurityContext, useGet;

void main() {
  SecurityContext sctx = useSecurityContext(cert: 'cert.pem', pkey: 'key.pem');

  // creates a new HttpServer, secure binds it to the given
  // host:port and handles incoming requests
  useSecureHttpServer('localhost', 443, sctx);

  // creates a new route with GET method
  // or if route exists appends a new method to it.
  // overrides the method if it already exists.
  // handleGuard is optional and must return a boolean!
  useGet(
      route: '/home',
      handleRequest: (req, res) => res.write('<h1>hallo "secure" world</h1>'),
      handleGuard: (req, res) => true); // optional
}
