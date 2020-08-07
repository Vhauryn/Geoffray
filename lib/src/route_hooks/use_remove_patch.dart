import '../helpers/handle_remove_route.dart';
import '../globals/state.dart';
import '../globals/typedefs.dart' show PATCH, ROUTES;

useRemovePatch(String route) =>
    state[ROUTES] = handleRemoveRoute(state[ROUTES], route, PATCH);