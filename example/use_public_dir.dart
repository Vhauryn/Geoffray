import 'package:geoffrey/hooks.dart'
    show useHttpServer, useGet, usePublicDir, useContext, useSubscribe;

void main() {
  useSubscribe(useContext('default'));
  usePublicDir('./example/mocks_data_assets/web-default');

  useGet(
      route: '/switch',
      handleRequest: (req, res) {
        useSubscribe(useContext('secret'));
        res.write('switched to secret');
      });

  useSubscribe(useContext('secret'));
  usePublicDir('./example/mocks_data_assets/web-secret');

  useGet(
      route: '/switch',
      handleRequest: (req, res) {
        useSubscribe(useContext('default'));
        res.write('switched to default');
      });

  useSubscribe(useContext('default'));
  useHttpServer('localhost', 8080);
}
