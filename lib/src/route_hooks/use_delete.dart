import 'package:meta/meta.dart';
import '../helpers/add_route.dart';
import '../globals/typedefs.dart' show DELETE, HandleReqRes, HandleMiddleware;

void useDelete(
        {@required String route,
        @required HandleReqRes handleRequest,
        HandleMiddleware handleGuard}) =>
    addRoute(DELETE, route, handleRequest, handleGuard);
