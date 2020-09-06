import 'dart:collection';
import '../globals/context.dart';
import '../globals/typedefs.dart';

void addRoute(String method, String path, HandleReqRes hr,
    [HandleMiddleware hg]) {
  if (path == ROOT_PATH) throw "The route $path is reserved and can't be set";

  List<int> indexes = [];
  final list = path.split('/').where((str) => str?.isNotEmpty).toList();

  for (int i = 0; i < list.length; i++)
    if (list[i].startsWith(':')) indexes.add(i);

  putMethod() => {REQUEST: hr, GUARD: hg};
  putRoute() => HashMap<String, dynamic>.from({
        method: {REQUEST: hr, GUARD: hg},
        DYNAMIC_PATH_SEGMENTS: list,
        PATH_SEGMENT_INDEXES: indexes
      });

  CONTEXT.routes.containsKey(path)
      ? CONTEXT.routes[path].putIfAbsent(method, putMethod)
      : CONTEXT.routes.putIfAbsent(path, putRoute);
}
