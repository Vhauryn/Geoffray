import 'package:test/test.dart';
import 'package:geoffrey/src/globals/context.dart';
import 'package:geoffrey/src/globals/typedefs.dart';
import 'package:geoffrey/hooks.dart'
    show
        useGet,
        usePut,
        usePost,
        usePatch,
        useDelete,
        useCustom,
        useAll,
        useContext,
        useRemoveGet,
        useRemovePut,
        useRemovePost,
        useRemovePatch,
        useRemoveDelete,
        useRemoveCustom,
        useRemoveAll;

void main() {
  group('Manage Routes', () {
    final home = '/home';
    final about = '/about';
    final routes = CONTEXT.routes;

    test('useGet adds a route and the GET method to state/context', () {
      useGet(route: home, handleRequest: (req, res) => res.write(GET));
      expect(routes.containsKey(home), true);
      expect(routes[home].containsKey(GET), true);
    });

    test('usePut adds a route and the PUT method to state/context', () {
      usePut(route: home, handleRequest: (req, res) => res.write(PUT));
      expect(routes.containsKey(home), true);
      expect(routes[home].containsKey(PUT), true);
    });

    test('usePost adds a route and the POST method to state/context', () {
      usePost(route: home, handleRequest: (req, res) => res.write(POST));
      expect(routes.containsKey(home), true);
      expect(routes[home][POST][REQUEST] != null, true);
      expect(routes[home][POST][GUARD] == null, true);
    });

    test('usePatch adds a route and the PATCH method to state/context', () {
      usePatch(
          route: home,
          handleRequest: (req, res) => res.write(PATCH),
          handleGuard: (req, res) => false);
      expect(routes[home].containsKey(PATCH), true);
      expect(routes[home][PATCH][REQUEST] != null, true);
      expect(routes[home][PATCH][GUARD](null, null), false);
    });

    test('useDelete adds a route and the DELETE method to state/context', () {
      useDelete(
          route: home,
          handleRequest: (req, res) => res.write(DELETE),
          handleGuard: (req, res) => true);
      expect(routes[home][DELETE][REQUEST] != null, true);
      expect(routes[home][DELETE][GUARD](null, null), true);
    });

    test('useCustom adds a route and a custom method to state/context', () {
      String customMethod = 'X-MAGIC-RABBIT';
      useCustom(
          route: home,
          method: customMethod,
          handleRequest: (req, res) => res.write(customMethod));
      expect(routes[home][customMethod][REQUEST] != null, true);
      expect(routes[home][customMethod][GUARD] == null, true);
    });

    test('remove route and method from state/context', () {
      String customMethod = 'X-MAGIC-RABBIT';
      useRemoveCustom(home, customMethod);
      expect(routes[home].containsKey(customMethod), false);
      useRemoveGet(home);
      expect(routes[home].containsKey(GET), false);
      useRemovePut(home);
      expect(routes[home].containsKey(PUT), false);
      useRemovePost(home);
      expect(routes[home].containsKey(POST), false);
      useRemoveDelete(home);
      expect(routes[home].containsKey(DELETE), false);
      useRemovePatch(home);
      expect(routes.containsKey(home), false);
    });

    test('useAll adds all http methods to given route', () {
      useAll(
          route: about,
          handleRequest: (req, res) => res.write('this is about..'));
      expect(routes[about].containsKey(GET), true);
      expect(routes[about].containsKey(PUT), true);
      expect(routes[about].containsKey(POST), true);
      expect(routes[about].containsKey(PATCH), true);
      expect(routes[about].containsKey(DELETE), true);
    });

    test('useRemoveAll removes all http methods from given route', () {
      useRemoveAll(about);
      expect(routes.containsKey(about), false);
    });

    test('state properties always references the context properties', () {
      // routes object in state is the same routes object in context
      expect(routes == CONTEXT.routes, true);
      // subscribing the state to a new context
      useContext('other');
      // routes object of the previous state is not the same routes object in the new context
      expect(routes == CONTEXT.routes, false);
      // since state always references the subscribed context the routes object
      // of the previous state is not the same route object in the new CONTEXT.
      expect(routes == CONTEXT.routes, false);
    });
  });
}
