import 'package:test/test.dart';
import 'package:geoffrey/src/globals/context.dart';
import 'package:geoffrey/src/globals/typedefs.dart';
import 'package:geoffrey/hooks.dart' show useMiddleware, useContext;

void main() {
  group('Manage Middlewares', () {
    Set<HandleMiddleware> middlewares = CONTEXT.middlewares;

    test('useMiddleware adds middlewares', () {
      expect(middlewares.isEmpty, true);
      useMiddleware((req, res) => true);
      expect(middlewares.length, equals(1));
      useMiddleware((req, res) => false);
      expect(middlewares.length, equals(2));
    });

    test('switching the context useMiddleware behaves as expected', () {
      useContext('other');
      expect(middlewares == CONTEXT.middlewares, false);
      expect(middlewares.length, equals(2));
      expect(CONTEXT.middlewares.length, equals(0));
    });
  });
}
