import 'dart:io';
import '../globals/context.dart';
import 'resolve_method.dart';
import 'server_html_content.dart' show serveHtmlContent;

Future<void> resolveRoutes(HttpRequest request) async {
  String path = request.uri.path;
  String method = request.method;

  if (CONTEXT.routes.containsKey(path))
    await resolveMethod(path, method, request);
  else if (CONTEXT.publicDir != null)
    await serveHtmlContent(request);
  else {
    request.response.statusCode = HttpStatus.notFound;
    request.response.write('HTTP STATUS: 404 - Not Found');
  }

  if (CONTEXT.shouldAutoClose) await request.response.close();
}
