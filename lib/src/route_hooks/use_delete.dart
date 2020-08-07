import 'package:meta/meta.dart';
import '../globals/state.dart';
import '../helpers/add_route.dart';
import '../globals/typedefs.dart'
    show DELETE, ROUTES, HandleReqRes, HandleMiddleware;

void useDelete(
        {@required String route,
        @required HandleReqRes handleRequest,
        HandleMiddleware handleGuard}) =>
    addRoute(state[ROUTES], DELETE, route, handleRequest, handleGuard);
