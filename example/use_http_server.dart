import 'dart:convert';
import 'package:geoffrey/hooks.dart' show useHttpServer, useGet, usePost;

void main() {
  // creates a new HttpServer, binds it to the given
  // host:port and handles incoming requests
  useHttpServer('localhost', 8080);

  // creates a new route with GET method
  // or if route exists appends a new method to it
  // overrides the method if it already exists
  // handleGuard is optional and must return a boolean!
  useGet(
      route: '/home/:amount/cookies/:flavor',
      handleRequest: (req, res, _) => res.write('hello $_'),
      handleGuard: (req, res) => true); // optional

  useGet(
      route: '/home',
      handleRequest: (req, res, _) => res.write('babuu'),
      handleGuard: (req, res) => true);

  // here we add an additional post method to the route /home
  usePost(
      route: '/home', handleRequest: (req, res, _) => res.write('${jsonEncode(_)}'));
}
