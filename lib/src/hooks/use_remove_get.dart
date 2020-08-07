import 'dart:collection';
import '../globals/state.dart';
import '../globals/context.dart';
import '../globals/typedefs.dart';

useRemoveGet(String route) =>
    state[ROUTES] = handleRemoveRoute(state[ROUTES], route, GET);

HashMap<String, HashMap<String, Map<String, Function>>> handleRemoveRoute(
    HashMap<String, HashMap<String, Map<String, Function>>> routes,
    String route,
    String method) {
  if (routes.containsKey(route)) {
    routes[route].remove(method);
    if (routes[route].isEmpty) routes.remove(route);
  }

  contexts[state[CURRENT_CONTEXT]].routes = routes;
  return routes;
}
