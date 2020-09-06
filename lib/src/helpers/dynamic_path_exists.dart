import '../globals/context.dart';

String dynamicRouteExists(String baseRoute) {
  String dynamicRoute = '';
  CONTEXT.routes.entries.any((pathName) {
    bool exists = pathName.key.contains(baseRoute);
    if (exists && pathName.key.contains(':')) dynamicRoute = pathName.key;
    return exists;
  });

  return dynamicRoute;
}
