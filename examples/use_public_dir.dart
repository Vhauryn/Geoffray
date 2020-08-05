import 'package:geoffrey/hooks.dart'
    show useServe, useGet, usePublicDir, useContext, useSubscribe;

// visit http://localhost:8080/switch to toggle the context

Future<void> main() async {
  var ctx1 = useContext('default');
  useSubscribe(ctx1);

  // this public dir will be bound to the subscribed context
  usePublicDir('web');

  useGet(
      route: '/switch',
      handleRequest: (req, res) {
        useSubscribe(useContext('secret'));
        res.write('switched to secret');
      },
      handleGuard: (req, res) => true);

  var ctx2 = useContext('secret');
  useSubscribe(ctx2);
  usePublicDir('secret');
  useGet(
      route: '/switch',
      handleRequest: (req, res) {
        useSubscribe(useContext('default'));
        res.write('switched to default');
      },
      handleGuard: (req, res) => true);

  useServe('localhost', 8080);
}
