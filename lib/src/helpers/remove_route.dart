import '../globals/context.dart';

void removeRoute(String route, String method) {
  if (State.routes.containsKey(route)) {
    State.routes[route].length == 1
        ? State.routes.remove(route)
        : State.routes[route].remove(method);
  }
}
