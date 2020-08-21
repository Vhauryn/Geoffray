import 'package:test/test.dart';
import 'package:geoffrey/src/globals/state.dart';
import 'package:geoffrey/src/globals/typedefs.dart';
import 'package:geoffrey/hooks.dart'
    show useMiddleware, useSubscribe, useContext;

void main() {
  group('Manage Middlewares', () {
    Set<HandleMiddleware> middlewares = state[MIDDLEWARES];

    test('useMiddleware adds middlewares', () {
      expect(middlewares.isEmpty, true);
      useMiddleware((req, res) => true);
      expect(middlewares.length, equals(1));
      useMiddleware((req, res) => false);
      expect(middlewares.length, equals(2));
    });

    test('switching the context useMiddleware behaves as expected', () {
      useSubscribe(useContext('other'));
      expect(middlewares == state[MIDDLEWARES], false);
      expect(middlewares.length, equals(2));
      expect(state[MIDDLEWARES].length, equals(0));
    });
  });
}
