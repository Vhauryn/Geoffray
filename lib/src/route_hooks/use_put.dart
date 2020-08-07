import 'package:meta/meta.dart';
import '../globals/state.dart';
import '../helpers/add_route.dart';
import '../globals/typedefs.dart'
    show PUT, ROUTES, HandleReqRes, HandleMiddleware;

void usePut(
        {@required String route,
        @required HandleReqRes handleRequest,
        HandleMiddleware handleGuard}) =>
    addRoute(state[ROUTES], PUT, route, handleRequest, handleGuard);
