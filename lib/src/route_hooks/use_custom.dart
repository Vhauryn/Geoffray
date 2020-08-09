import 'package:meta/meta.dart';
import '../globals/state.dart';
import '../handlers/add_route.dart';
import '../globals/typedefs.dart'
    show ROUTES, HandleReqRes, HandleMiddleware;

void useCustom(
        {@required String route,
        @required String method,
        @required HandleReqRes handleRequest,
        HandleMiddleware handleGuard}) =>
    addRoute(state[ROUTES], method.toUpperCase(), route, handleRequest, handleGuard);