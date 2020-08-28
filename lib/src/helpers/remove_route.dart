import '../globals/context.dart';

void removeRoute(String route, String method) {
  if (CONTEXT.routes.containsKey(route)) {
    CONTEXT.routes[route].length == 1
        ? CONTEXT.routes.remove(route)
        : CONTEXT.routes[route].remove(method);
  }
}
