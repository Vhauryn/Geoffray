import 'package:geoffrey/hooks.dart'
    show useHttpServer, useGet, useContext, useSubscribe, Context;

// Visit localhost:8080/home to switch to the secret context
// Visit localhost:8080/about to switch back to the default context
// Depending which context is subscribed certain routes are not be available!

void main() {
  // If no context name is provided it returns the default context.
  // If a context name is provided a new context is created or an
  // existing context returned
  Context defaultContext = useContext(); // Same as useContext('DEFAULT')
  Context secretContext = useContext('SECRET');

  // Binds the hooks to the subscribed context, here the defaultContext
  useSubscribe(defaultContext);

  // This route is recorded in the defaultContext
  // When visited switches to the secret context
  useGet(
      route: '/home',
      handleRequest: (req, res) {
        useSubscribe(useContext('SECRET'));
        res.write(
            'This is /home. Now switched to secret context. /home is no longer available!');
      });

  // Binds the hooks to the subscribed context, here the secretContext
  useSubscribe(secretContext);

  // This route is recorded in the secretContext
  // When visited switches to the default context
  useGet(
      route: '/about',
      handleRequest: (req, res) {
        useSubscribe(useContext('DEFAULT'));
        res.write(
            'This is /about. Now switched to default context. /about is no longer available!');
      });

  // Since we lastly have subscribed to the secretContext
  // the server will only listen to those routes inside the secretContext
  // So you won't reach /home till you've visited /about
  useHttpServer('localhost', 8080);
}
