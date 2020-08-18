import '../helpers/remove_route.dart';
import '../globals/state.dart';
import '../globals/typedefs.dart' show PUT, ROUTES;

useRemovePut(String route) =>
    state[ROUTES] = removeRoute(state[ROUTES], route, PUT);