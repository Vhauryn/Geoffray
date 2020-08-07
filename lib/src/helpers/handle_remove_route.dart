import 'dart:collection';
import '../globals/state.dart';
import '../globals/context.dart';
import '../globals/typedefs.dart';

HashMap<String, HashMap<String, Map<String, Function>>> handleRemoveRoute(
    HashMap<String, HashMap<String, Map<String, Function>>> routes,
    String route,
    String method) {
  routes.containsKey(route)
      ? routes[route].isEmpty
          ? routes.remove(route)
          : routes[route].remove(method)
      : contexts[state[CURRENT_CONTEXT]].routes = routes;
  return routes;
}
