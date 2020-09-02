import 'dart:collection';
import '../globals/context.dart';
import '../globals/typedefs.dart';

void addRoute(String method, String path, HandleReqRes hr,
    [HandleMiddleware hg]) {
  if (path == '/') throw "The route $path is reserved and can't be set";

  putMethod() => {REQUEST: hr, GUARD: hg};
  putRoute() => HashMap<String, Map<String, Function>>.from({
        method: {REQUEST: hr, GUARD: hg}
      });

  CONTEXT.routes.containsKey(path)
      ? CONTEXT.routes[path].putIfAbsent(method, putMethod)
      : CONTEXT.routes.putIfAbsent(path, putRoute);
}
