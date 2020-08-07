import '../helpers/handle_remove_route.dart';
import '../globals/state.dart';
import '../globals/typedefs.dart' show HEAD, ROUTES;

useRemoveHead(String route) =>
    state[ROUTES] = handleRemoveRoute(state[ROUTES], route, HEAD);