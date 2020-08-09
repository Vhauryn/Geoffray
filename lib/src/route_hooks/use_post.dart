import 'package:meta/meta.dart';
import '../globals/state.dart';
import '../handlers/add_route.dart';
import '../globals/typedefs.dart'
    show POST, ROUTES, HandleReqRes, HandleMiddleware;

void usePost(
        {@required String route,
        @required HandleReqRes handleRequest,
        HandleMiddleware handleGuard}) =>
    addRoute(state[ROUTES], POST, route, handleRequest, handleGuard);
