import 'dart:io';
import 'handle_route.dart';
import 'handle_middleware.dart';
import '../globals/state.dart';
import '../globals/typedefs.dart';

void resolveMethod(String path, String method, HttpRequest request) {
  if (state[ROUTES][path].containsKey(method)) {
    HandleMiddleware handleGuard = state[ROUTES][path][method][GUARD];
    HandleReqRes handleResponse = state[ROUTES][path][method][REQUEST];
    if (handleMiddleware(request, request.response))
      handleRoute(handleGuard, handleResponse, request);
    else {
      request.response.statusCode = HttpStatus.unprocessableEntity;
      request.response.write('HTTP STATUS: 422 - Unprocessable Entity');
    }
  } else {
    request.response.statusCode = HttpStatus.methodNotAllowed;
    request.response.write('HTTP STATUS: 405 - Method Not Allowed');
  }
}
