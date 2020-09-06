import 'dart:io';
import '../globals/context.dart';
import '../globals/typedefs.dart';
import 'resolve_method.dart';
import 'resolve_dynamic_route.dart';
import 'dynamic_path_exists.dart';
import 'route_is_valid.dart';
import 'server_html_content.dart' show serveHtmlContent;

Future<void> resolveRoutes(HttpRequest request) async {
  String path = request.uri.path;
  String method = request.method;
  List<String> reqUriPathSegments = request.uri.pathSegments;
  bool uriPathSegmentsExist = reqUriPathSegments.length > 0 ? true : false;
  String basePath = uriPathSegmentsExist ? request.uri.pathSegments.first : '';
  String dynamicRoute = dynamicRouteExists(basePath);

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
