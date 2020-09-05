import 'dart:io';
import 'handle_route.dart';
import 'handle_middleware.dart';
import '../globals/context.dart';
import '../globals/typedefs.dart';
import '../hooks/use_json.dart';

Future<void> resolveMethod(
    String path, String method, HttpRequest request) async {
  if (CONTEXT.routes[path].containsKey(method)) {
    HandleMiddleware handleGuard = CONTEXT.routes[path][method][GUARD];
    HandleReqRes handleResponse = CONTEXT.routes[path][method][REQUEST];
    if (await handleMiddleware(request, request.response))
      await handleRoute(handleGuard, handleResponse, request, {
        'queryParams': request.uri.queryParameters,
        'json': await useJSON(request)
      });
    else {
      request.response.statusCode = HttpStatus.unprocessableEntity;
      request.response.write('HTTP STATUS: 422 - Unprocessable Entity');
    }
  } else {
    request.response.statusCode = HttpStatus.methodNotAllowed;
    request.response.write('HTTP STATUS: 405 - Method Not Allowed');
  }
}
