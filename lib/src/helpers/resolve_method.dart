import 'dart:io';
import 'handle_route.dart';
import 'handle_middleware.dart';
import '../globals/context.dart';
import '../globals/typedefs.dart';
import '../globals/http_data.dart';
import '../hooks/use_json.dart';

Future<void> resolveMethod(String path, String method, HttpRequest request,
    [Map dynamicParams]) async {
  if (CONTEXT.routes[path].containsKey(method)) {
    HandleMiddleware handleGuard = CONTEXT.routes[path][method][GUARD];
    HandleReqRes handleResponse = CONTEXT.routes[path][method][REQUEST];
    if (await handleMiddleware(request, request.response))
      await handleRoute(
          handleGuard,
          handleResponse,
          request,
          HttpData.fromList([
            request.uri.queryParameters,
            await useJSON(request),
            dynamicParams ?? {}
          ]));
    else {
      request.response.statusCode = HttpStatus.unprocessableEntity;
      request.response.write(HTTP_UNPROCESSABLE_ENTITY);
    }
  } else {
    request.response.statusCode = HttpStatus.methodNotAllowed;
    request.response.write(HTTP_METHOD_NOT_ALLOWED);
  }
}
