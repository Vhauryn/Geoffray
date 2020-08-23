import 'dart:io';
import '../globals/typedefs.dart';

void handleRoute(HandleMiddleware handleGuard, HandleReqRes handleRequest,
    HttpRequest request) {
  if (handleGuard == null)
    handleRequest(request, request.response);
  else if (handleGuard(request, request.response))
    handleRequest(request, request.response);
  else {
    request.response.write('HTTP STATUS: 422 - Unprocessable Entity');
    request.response.statusCode = HttpStatus.unprocessableEntity;
  }
}
