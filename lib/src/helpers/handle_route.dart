import 'dart:io';
import '../globals/typedefs.dart';

void handleRoute(HandleMiddleware handleGuard, HandleReqRes handleRequest,
    HttpRequest request) {
  if (handleGuard != null && handleGuard(request, request.response))
    handleRequest(request, request.response);
  else if (handleGuard != null && !handleGuard(request, request.response)) {
    request.response.statusCode = HttpStatus.unprocessableEntity;
    request.response.write('HTTP STATUS: 422 - Unprocessable Entity');
  } else
    handleRequest(request, request.response);
}
