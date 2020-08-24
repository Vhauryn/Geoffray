import 'package:meta/meta.dart';
import '../helpers/add_route.dart';
import '../globals/typedefs.dart' show PATCH, HandleReqRes, HandleMiddleware;

void usePatch(
        {@required String route,
        @required HandleReqRes handleRequest,
        HandleMiddleware handleGuard}) =>
    addRoute(PATCH, route, handleRequest, handleGuard);
