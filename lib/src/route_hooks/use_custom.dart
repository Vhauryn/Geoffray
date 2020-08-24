import 'package:meta/meta.dart';
import '../helpers/add_route.dart';
import '../globals/typedefs.dart' show HandleReqRes, HandleMiddleware;

void useCustom(
        {@required String route,
        @required String method,
        @required HandleReqRes handleRequest,
        HandleMiddleware handleGuard}) =>
    addRoute(method.toUpperCase(), route, handleRequest, handleGuard);
