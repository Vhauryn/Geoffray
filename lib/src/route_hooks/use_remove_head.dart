import '../helpers/remove_route.dart';
import '../globals/state.dart';
import '../globals/typedefs.dart' show HEAD, ROUTES;

useRemoveHead(String route) =>
    state[ROUTES] = removeRoute(state[ROUTES], route, HEAD);