import 'dart:io';
import 'resolve_method.dart';
import '../globals/context.dart';

Future<void> resolveDynamicRoute(
    HttpRequest request, String dynamicRoute, method) async {
  Map mappedValues = mapDynamicPathToValues(request, dynamicRoute);

  if (mappedValues.isNotEmpty && isDynamicPathValid(request, dynamicRoute)) {
    await resolveMethod(dynamicRoute, method, request, mappedValues);
  } else {
    request.response.statusCode = HttpStatus.notFound;
    request.response.write('HTTP STATUS: 404 - Not Found');
  }
}

bool isDynamicPathValid(HttpRequest request, String dynamicRoute) {
  bool dynamicPathIsValid = true;
  for (String item in CONTEXT.routes[dynamicRoute]['DYNAMIC_PATH_SEGMENTS'])
    if (item.startsWith(':') || request.uri.pathSegments.contains(item))
      continue;
    else
      dynamicPathIsValid = false;

  return dynamicPathIsValid;
}

Map<String, String> mapDynamicPathToValues(
    HttpRequest request, String dynamicRoute) {
  if (CONTEXT.routes[dynamicRoute]['PATH_SEGMENT_INDEXES'].isEmpty) return {};

  Map<String, String> mappedValues = {};

  List<String> dynamicPathSegments =
      CONTEXT.routes[dynamicRoute]['DYNAMIC_PATH_SEGMENTS'];

  List<String> list =
      request.uri.path.split('/').where((str) => str?.isNotEmpty).toList();

  for (int index in CONTEXT.routes[dynamicRoute]['PATH_SEGMENT_INDEXES'])
    if (list.isNotEmpty)
      mappedValues.putIfAbsent(
          dynamicPathSegments[index].split(':').last, () => list[index]);

  return mappedValues;
}
