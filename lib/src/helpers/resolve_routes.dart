import 'dart:io';
import '../globals/context.dart';
import 'resolve_method.dart';
import 'resolve_dynamic_route.dart';
import 'server_html_content.dart' show serveHtmlContent;

bool isValidRoute(String path) =>
    CONTEXT.routes[path] != null && path != '/' && path != '/favicon.ico';

String dynamicRouteExists(String baseRoute) {
  String dynamicRoute = '';
  CONTEXT.routes.entries.any((pathName) {
    bool exists = pathName.key.contains(baseRoute);
    if (exists && pathName.key.contains(':')) dynamicRoute = pathName.key;
    return exists;
  });

  return dynamicRoute;
}

Future<void> resolveRoutes(HttpRequest request) async {
  String path = request.uri.path;
  String method = request.method;
  List<String> reqUriPathSegments = request.uri.pathSegments;
  bool uriPathSegmentsExist = reqUriPathSegments.length > 0 ? true : false;
  String basePath = uriPathSegmentsExist ? request.uri.pathSegments.first : '';
  String dynamicRoute = dynamicRouteExists(basePath);

  if (isValidRoute(path))
    await resolveMethod(path, method, request);
  else if (CONTEXT.publicDir != null)
    await serveHtmlContent(request);
  else if (dynamicRoute.isNotEmpty)
    await resolveDynamicRoute(request, dynamicRoute, method);
  else {
    request.response.statusCode = HttpStatus.notFound;
    request.response.write('HTTP STATUS: 404 - Not Found');
  }

  if (CONTEXT.shouldAutoClose) await request.response.close();
}
