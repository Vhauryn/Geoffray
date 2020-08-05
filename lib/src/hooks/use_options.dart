import 'package:meta/meta.dart';
import '../globals/typedefs.dart';
import '../globals/state.dart';
import '../helpers/add_route.dart';

void useOptions(
        {@required String route,
        @required HandleReqRes handleRequest,
        HandleMiddleware handleGuard}) =>
    addRoute(state[ROUTES], OPTIONS, route, handleRequest, handleGuard);
