import 'dart:collection';
import '../globals/typedefs.dart';

void addRoute(HashMap<String, HashMap<String, Map<String, Function>>> routes,
    String method, String path, HandleReqRes hr,
    [HandleMiddleware hg]) {
  if (path.contains('/'))
    throw 'The route "/" is used for serving html/files and thus can\'t be set!';

  putMethod() => {REQUEST: hr, GUARD: hg};
  putRoute() => HashMap<String, Map<String, Function>>.from({
        method: {REQUEST: hr, GUARD: hg}
      });

  routes.containsKey(path)
      ? routes[path].putIfAbsent(method, putMethod)
      : routes.putIfAbsent(path, putRoute);
}
