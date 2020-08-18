import 'package:meta/meta.dart';
import '../globals/state.dart';
import '../helpers/add_route.dart';
import '../globals/typedefs.dart'
    show OPTIONS, ROUTES, HandleReqRes, HandleMiddleware;

void useOptions(
        {@required String route,
        @required HandleReqRes handleRequest,
        HandleMiddleware handleGuard}) =>
    addRoute(state[ROUTES], OPTIONS, route, handleRequest, handleGuard);
