import 'package:meta/meta.dart';
import '../globals/state.dart';
import '../handlers/add_route.dart';
import '../globals/typedefs.dart'
    show PATCH, ROUTES, HandleReqRes, HandleMiddleware;

void usePatch(
        {@required String route,
        @required HandleReqRes handleRequest,
        HandleMiddleware handleGuard}) =>
    addRoute(state[ROUTES], PATCH, route, handleRequest, handleGuard);
