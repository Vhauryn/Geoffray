import '../handlers/remove_route.dart';
import '../globals/state.dart';
import '../globals/typedefs.dart' show POST, ROUTES;

useRemovePost(String route) =>
    state[ROUTES] = removeRoute(state[ROUTES], route, POST);