import '../globals/context.dart';

void removeRoute(String route, String method) {
  if (CONTEXT.routes.containsKey(route)) {
    // if route is length 3 then it only contains one method
    // since we don't care about the dynamic path segments and indexes
    // we can safely delete the whole route
    CONTEXT.routes[route].length == 3
        ? CONTEXT.routes.remove(route)
        : CONTEXT.routes[route].remove(method);
  }
}
