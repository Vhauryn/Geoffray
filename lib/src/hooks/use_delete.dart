import 'package:meta/meta.dart';
import '../globals/typedefs.dart';
import '../globals/state.dart';
import '../helpers/add_route.dart';

void useDelete(
        {@required String route,
        @required HandleReqRes handleRequest,
        HandleMiddleware handleGuard}) =>
    addRoute(state[ROUTES], DELETE, route, handleRequest, handleGuard);
