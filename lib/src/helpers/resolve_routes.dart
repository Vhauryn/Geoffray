import 'dart:io';
import '../globals/state.dart';
import '../globals/typedefs.dart';
import 'resolve_method.dart';
import 'server_html_content.dart' show serveHtmlContent;

void resolveRoutes(HttpRequest request) {
  String path = request.uri.path;
  String method = request.method;

  if (path == '/' && state[PUBLIC_DIR] != null)
    serveHtmlContent(request);
  else if (state[ROUTES].containsKey(path))
    resolveMethod(path, method, request);
  else {
    request.response.statusCode = HttpStatus.notFound;
    request.response.write('HTTP STATUS: 404 - Not Found');
  }

  if (state[SHOULD_AUTO_CLOSE]) request.response.close();
}
