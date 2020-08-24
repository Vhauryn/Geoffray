import 'dart:io';
import '../globals/context.dart';
import 'resolve_method.dart';
import 'server_html_content.dart' show serveHtmlContent;

void resolveRoutes(HttpRequest request) async {
  String path = request.uri.path;
  String method = request.method;

  if (State.routes.containsKey(path))
    resolveMethod(path, method, request);
  else if (State.publicDir != null)
    await serveHtmlContent(request);
  else {
    request.response.statusCode = HttpStatus.notFound;
    request.response.write('HTTP STATUS: 404 - Not Found');
  }

  if (State.shouldAutoClose) await request.response.close();
}
