import 'package:geoffrey/hooks.dart';
import '../globals/context.dart';

String dynamicRouteExists(HttpRequest request) {
  String dynamicRoute = '';
  List<String> reqUriPathSegments = request.uri.pathSegments;
  bool uriPathSegmentsExist = reqUriPathSegments.length > 0 ? true : false;
  String basePath = uriPathSegmentsExist ? request.uri.pathSegments.first : '';

  CONTEXT.routes.entries.any((pathName) {
    bool exists = pathName.key.contains(basePath);
    if (exists && pathName.key.contains(':')) dynamicRoute = pathName.key;
    return exists;
  });

  return dynamicRoute;
}
