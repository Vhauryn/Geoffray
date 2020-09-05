import 'dart:io';
import 'resolve_method.dart';
import '../globals/context.dart';

Future<dynamic> resolveDynamicRoute(
    HttpRequest request, String dynamicRoute, method) async {
  Map mappedValues = mapDynamicPathToValues(request, dynamicRoute);

  if (mappedValues.isNotEmpty)
    await resolveMethod(dynamicRoute, method, request);
  else {
    request.response.statusCode = HttpStatus.notFound;
    request.response.write('HTTP STATUS: 404 - Not Found');
  }
}

Map<String, String> mapDynamicPathToValues(
    HttpRequest request, String dynamicRoute) {
  Map<String, String> mappedValues = {};

  List<String> dynamicPathSegments =
      CONTEXT.routes[dynamicRoute]['DYNAMIC_PATH_SEGMENTS'];

  List<String> list =
      request.uri.path.split('/').where((str) => str?.isNotEmpty).toList();

  for (String item in dynamicPathSegments)
    if (item.startsWith(':') || request.uri.pathSegments.contains(item))
      continue;

  for (int index in CONTEXT.routes[dynamicRoute]['PATH_SEGMENT_INDEXES'])
    if(list.isNotEmpty) mappedValues.putIfAbsent(
        dynamicPathSegments[index].split(':').last, () => list[index]);

  return mappedValues;
}
