import '../helpers/handle_remove_route.dart';
import '../globals/state.dart';
import '../globals/typedefs.dart' show GET, ROUTES;

useRemoveGet(String route) =>
    state[ROUTES] = handleRemoveRoute(state[ROUTES], route, GET);
