import 'package:geoffrey/hooks.dart'
    show
        useHttpServer,
        useGet,
        usePublicDir,
        useContext,
        useSubscribe,
        useRemoveGet;

// visit http://localhost:8080/switch to toggle the context

void main() {
  var ctx1 = useContext('default');
  useSubscribe(ctx1);

  // this public dir will be bound to the subscribed context
  usePublicDir('./examples/mocks_data_assets/web-default');

  // adding /switch route to default context
  useGet(
      route: '/switch',
      handleRequest: (req, res) {
        useSubscribe(useContext('secret')); // changing to secret context
        res.write('switched to secret');
      },
      handleGuard: (req, res) => true);

  var ctx2 = useContext('secret');
  useSubscribe(ctx2);
  usePublicDir('./examples/mocks_data_assets/web-secret');

  // adding /switch route to secret
  useGet(
      route: '/switch',
      handleRequest: (req, res) {
        useRemoveGet('/switch'); // removing /switch route from secret context
        useSubscribe(useContext('default')); // changing to default context
        res.write('switched to default');
      },
      handleGuard: (req, res) => true);

  useHttpServer('localhost', 8080);
}
