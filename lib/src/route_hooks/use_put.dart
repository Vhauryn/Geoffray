import 'package:meta/meta.dart';
import '../helpers/add_route.dart';
import '../globals/typedefs.dart' show PUT, HandleReqRes, HandleMiddleware;

void usePut(
        {@required String route,
        @required HandleReqRes handleRequest,
        HandleMiddleware handleGuard}) =>
    addRoute(PUT, route, handleRequest, handleGuard);
