import 'dart:io';
import 'handle_route.dart';
import 'handle_middleware.dart';
import '../globals/context.dart';
import '../globals/typedefs.dart';

Future<void> resolveMethod(String path, String method, HttpRequest request) async {
  if (State.routes[path].containsKey(method)) {
    HandleMiddleware handleGuard = State.routes[path][method][GUARD];
    HandleReqRes handleResponse = State.routes[path][method][REQUEST];
    if (handleMiddleware(request, request.response))
      await handleRoute(handleGuard, handleResponse, request);
    else {
      request.response.statusCode = HttpStatus.unprocessableEntity;
      request.response.write('HTTP STATUS: 422 - Unprocessable Entity');
    }
  } else {
    request.response.statusCode = HttpStatus.methodNotAllowed;
    request.response.write('HTTP STATUS: 405 - Method Not Allowed');
  }
}
