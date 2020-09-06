import 'package:geoffrey/hooks.dart'
    show useHttpServer, useGet, usePublicDir, useContext, useRemoveGet;

// visit http://localhost:8080/switch to toggle the context

void main() {
  useContext('default');

  // this public dir will be bound to the subscribed context
  usePublicDir('./example/mocks_data_assets/web-default');

  // adding /switch route to default context
  useGet(
      route: '/switch',
      handleRequest: (req, res, data) {
        useContext('secret'); // changing to secret context
        res.write('switched to secret');
      },
      handleGuard: (req, res) => true);

  useContext('secret');

  usePublicDir('./example/mocks_data_assets/web-secret');

  // adding /switch route to secret
  useGet(
      route: '/switch',
      handleRequest: (req, res, data) {
        useRemoveGet('/switch'); // removing /switch route from secret context
        useContext('default'); // changing to default context
        res.write('switched to default');
      },
      handleGuard: (req, res) => true);

  useHttpServer('localhost', 8080);
}
