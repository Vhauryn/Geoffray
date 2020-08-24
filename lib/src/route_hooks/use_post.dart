import 'package:meta/meta.dart';
import '../helpers/add_route.dart';
import '../globals/typedefs.dart' show POST, HandleReqRes, HandleMiddleware;

void usePost(
        {@required String route,
        @required HandleReqRes handleRequest,
        HandleMiddleware handleGuard}) =>
    addRoute(POST, route, handleRequest, handleGuard);
