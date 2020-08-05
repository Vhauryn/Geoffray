import 'package:geoffrey/hooks.dart' show useHttpServer, useGet, usePost;

void main() {
  // HOOK ORDER DOES NOT MATTER!!!

  // creates a new HttpServer, binds it to the given 
  // host:port and handles incoming requests
  useHttpServer('localhost', 8080);

  // creates a new route with GET method
  // or if route exists appends a new method to it
  // overrides the method if it already exists
  useGet(
      route: '/',
      handleRequest: (req, res) => res.write('hallo') ,
      handleGuard: (req, res) => true);

  // here we add an additional post method to the route /
  // since handleGuard returns false we will get a 422 Unprocessable Entity
  // thus we won't reach post on route /
  usePost(
      route: '/',
      handleRequest: (req, res) => res.write('world'),
      handleGuard: (req, res) => false);
}
