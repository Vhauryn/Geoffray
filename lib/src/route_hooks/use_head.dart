import 'package:meta/meta.dart';
import '../globals/state.dart';
import '../handlers/add_route.dart';
import '../globals/typedefs.dart'
    show HEAD, ROUTES, HandleReqRes, HandleMiddleware;

void useHead(
        {@required String route,
        @required HandleReqRes handleRequest,
        HandleMiddleware handleGuard}) =>
    addRoute(state[ROUTES], HEAD, route, handleRequest, handleGuard);
