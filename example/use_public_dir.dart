import 'package:geoffrey/hooks.dart'
    show useHttpServer, useGet, usePublicDir, useContext;

void main() {
  useContext('default');
  usePublicDir('./example/mocks_data_assets/web-default');

  useGet(
      route: '/switch',
      handleRequest: (req, res) {
        useContext('secret');
        res.write('switched to secret');
      });

  useContext('secret');
  usePublicDir('./example/mocks_data_assets/web-secret');

  useGet(
      route: '/switch',
      handleRequest: (req, res) {
        useContext('default');
        res.write('switched to default');
      });

  useContext('default');
  useHttpServer('localhost', 8080);
}
