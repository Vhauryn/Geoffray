import '../handlers/remove_route.dart';
import '../globals/state.dart';
import '../globals/typedefs.dart' show OPTIONS, ROUTES;

useRemoveOptions(String route) =>
    state[ROUTES] = removeRoute(state[ROUTES], route, OPTIONS);