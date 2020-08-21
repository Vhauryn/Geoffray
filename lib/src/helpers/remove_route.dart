import '../globals/state.dart';
import '../globals/typedefs.dart';

void removeRoute(String route, String method) {
  if (state[ROUTES].containsKey(route)) {
    state[ROUTES][route].length == 1
        ? state[ROUTES].remove(route)
        : state[ROUTES][route].remove(method);
  }
}
