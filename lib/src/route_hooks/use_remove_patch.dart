import '../helpers/remove_route.dart';
import '../globals/state.dart';
import '../globals/typedefs.dart' show PATCH, ROUTES;

useRemovePatch(String route) =>
    state[ROUTES] = removeRoute(state[ROUTES], route, PATCH);