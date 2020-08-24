import 'package:meta/meta.dart';
import '../helpers/add_route.dart';
import '../globals/typedefs.dart' show GET, HandleReqRes, HandleMiddleware;

void useGet(
        {@required String route,
        @required HandleReqRes handleRequest,
        HandleMiddleware handleGuard}) =>
    addRoute(GET, route, handleRequest, handleGuard);
