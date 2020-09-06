import 'dart:io';
import '../globals/context.dart';
import '../globals/typedefs.dart';
import 'resolve_method.dart';
import 'resolve_dynamic_route.dart';
import 'dynamic_route_exists.dart';
import 'route_is_valid.dart';
import 'server_html_content.dart' show serveHtmlContent;

Future<void> resolveRoutes(HttpRequest request) async {
  final path = request.uri.path;
  final method = request.method;
  final dynamicRoute = dynamicRouteExists(request);

  if (routeIsValid(path))
    await resolveMethod(path, method, request);
  else if (CONTEXT.publicDir != null)
    await serveHtmlContent(request);
  else if (dynamicRoute.isNotEmpty)
    await resolveDynamicRoute(request, dynamicRoute, method);
  else {
    request.response.statusCode = HttpStatus.notFound;
    request.response.write(HTTP_NOT_FOUND);
  }

  if (CONTEXT.shouldAutoClose) await request.response.close();
}
