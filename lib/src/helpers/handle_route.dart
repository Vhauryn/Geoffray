import 'dart:io';
import '../globals/typedefs.dart';

Future<void> handleRoute(HandleMiddleware handleGuard, HandleReqRes handleRequest,
    HttpRequest request) async {
  if (handleGuard == null)
    await handleRequest(request, request.response);
  else if (await handleGuard(request, request.response))
    await handleRequest(request, request.response);
  else {
    request.response.statusCode = HttpStatus.unprocessableEntity;
    request.response.write(HTTP_UNPROCESSABLE_ENTITY);
  }
}
