import 'package:geoffrey/hooks.dart'
    show useHttpServer, useGet, usePost, useCustom;

void main() {
  // setting / as a route will throw an Error
  // this is due to the / route is reserved for serving html/files
  // useGet(
  //     route: '/',
  //     handleRequest: (req, res) => res.write('reserved route!'),
  //     handleGuard: (req, res) => true);

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
  // since handleGuard returns false we will get a 422 Unprocessable Entity
  // thus we won't reach post on route /home
  usePost(
      route: '/home',
      handleRequest: (req, res) => res.write('world'),
      handleGuard: (req, res) => false);

  // here we set a custom method
  useCustom(
      route: '/home',
      method: 'x-magic-rabbit',
      handleRequest: (req, res) => res.write('a wild magic rabbit appeared!'));
}
