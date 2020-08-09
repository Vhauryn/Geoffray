import '../handlers/remove_route.dart';
import '../globals/state.dart';
import '../globals/typedefs.dart' show DELETE, ROUTES;

useRemoveDelete(String route) =>
    state[ROUTES] = removeRoute(state[ROUTES], route, DELETE);