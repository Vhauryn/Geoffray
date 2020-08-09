import '../handlers/remove_route.dart';
import '../globals/state.dart';
import '../globals/typedefs.dart' show GET, ROUTES;

useRemoveGet(String route) =>
    state[ROUTES] = removeRoute(state[ROUTES], route, GET);
