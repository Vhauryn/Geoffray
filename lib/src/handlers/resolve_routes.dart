import 'dart:io';
import 'dart:collection';
import '../globals/state.dart';
import '../globals/typedefs.dart';
import 'server_html_content.dart' show serveHtmlContent;

void resolveRoutes(HttpRequest request,
    HashMap<String, HashMap<String, Map<String, Function>>> routes) async {
  String path = request.uri.path;
  String method = request.method;

  if (routes.containsKey(path) && path != '/') {
    if (routes[path].containsKey(method)) {
      HandleMiddleware handleGuard = routes[path][method][GUARD];
      HandleReqRes handleResponse = routes[path][method][REQUEST];
      if (handleMiddleware(request, request.response, state[MIDDLEWARES]))
        routeHandlers(handleGuard, handleResponse, request);
      else
        request.response.statusCode = HttpStatus.unprocessableEntity;
    } else
      request.response.statusCode = HttpStatus.methodNotAllowed;
  } else if (state[PUBLIC_DIR] != null) await serveHtmlContent(request);

  await request.response.close();
}

bool handleMiddleware(HttpRequest req, HttpResponse res,
        Set<bool Function(HttpRequest, HttpResponse)> Middlewares) =>
    Middlewares.every((middleware) => middleware(req, res));

void routeHandlers(HandleMiddleware handleGuard, HandleReqRes handleRequest,
    HttpRequest request) {
  if (handleGuard != null && handleGuard(request, request.response))
    handleRequest(request, request.response);
  else if (handleGuard != null && !handleGuard(request, request.response))
    request.response.statusCode = HttpStatus.unprocessableEntity;
  else
    handleRequest(request, request.response);
}
