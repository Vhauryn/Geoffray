import 'package:meta/meta.dart';
import '../helpers/add_route.dart';
import '../globals/typedefs.dart'
    show DELETE, GET, PUT, PATCH, POST, HandleReqRes, HandleMiddleware;

void useAll(
    {@required String route,
    @required HandleReqRes handleRequest,
    HandleMiddleware handleGuard}) {
  addRoute(GET, route, handleRequest, handleGuard);
  addRoute(PUT, route, handleRequest, handleGuard);
  addRoute(POST, route, handleRequest, handleGuard);
  addRoute(PATCH, route, handleRequest, handleGuard);
  addRoute(DELETE, route, handleRequest, handleGuard);
}
