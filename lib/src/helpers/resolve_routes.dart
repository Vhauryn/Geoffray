import 'dart:io';
import 'dart:collection';
import 'server_html_content.dart' show serveHtmlContent;
import 'handle_route.dart';
import 'handle_middleware.dart';
import '../globals/state.dart';
import '../globals/typedefs.dart';

void resolveRoutes(HttpRequest request,
    HashMap<String, HashMap<String, Map<String, Function>>> routes) async {
  String path = request.uri.path;
  String method = request.method;

  try {
    if (routes.containsKey(path) && path != '/') {
      if (routes[path].containsKey(method)) {
        HandleMiddleware handleGuard = routes[path][method][GUARD];
        HandleReqRes handleResponse = routes[path][method][REQUEST];
        if (handleMiddleware(request, request.response)) {
          handleRoute(handleGuard, handleResponse, request);
        } else {
          request.response.statusCode = HttpStatus.unprocessableEntity;
        }
      } else {
        request.response.statusCode = HttpStatus.methodNotAllowed;
      }
    } else if (state[PUBLIC_DIR] != null) await serveHtmlContent(request);
  } finally {
    await request.response.close();
  }

  // handle msg for index.html not available
  // serve default html and favicon?
  // available routes/configs like in swagger?
  //request.response.statusCode = HttpStatus.notFound;
}
