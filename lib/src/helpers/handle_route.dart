import 'dart:io';
import '../globals/typedefs.dart';
import '../globals/request_data.dart';

Future<void> handleRoute(HandleMiddleware handleGuard, HandleReqRes handleRequest,
    HttpRequest request, RequestData data) async {
  if (handleGuard == null)
    await handleRequest(request, request.response, data);
  else if (await handleGuard(request, request.response))
    await handleRequest(request, request.response, data);
  else {
    request.response.statusCode = HttpStatus.unprocessableEntity;
    request.response.write(HTTP_UNPROCESSABLE_ENTITY);
  }
}
