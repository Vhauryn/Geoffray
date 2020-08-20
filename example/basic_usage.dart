import 'package:geoffrey/hooks.dart'
    show useHttpServer, useGet, usePost, useCustom;

void main() {
  // creates a new HttpServer, binds it to the given
  // host:port and handles incoming requests
  useHttpServer('localhost', 8080);

  // creates a new route with GET method
  // or if route exists appends a new method to it
  // overrides the method if it already exists
  // handleGuard is optional and must return a boolean!
  useGet(
      route: '/home',
      handleRequest: (req, res) => res.write('hallo'),
      handleGuard: (req, res) => true); // optional

  // here we add an additional post method to the route /home
  usePost(
      route: '/home',
      handleRequest: (req, res) => res.write('world'));

  // here we set a custom method
  // since handleGuard returns false we will get a 422 Unprocessable Entity
  useCustom(
      route: '/home',
      method: 'x-magic-rabbit',
      handleGuard: (req, res) => false,
      handleRequest: (req, res) => res.write('a wild magic rabbit appeared!'));
}
