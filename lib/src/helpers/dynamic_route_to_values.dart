import 'dart:io';
import '../globals/context.dart';
import '../globals/typedefs.dart';

Map<String, String> dynamicRouteToValues(
    HttpRequest request, String dynamicRoute) {
  if (dynamicRoute.isEmpty) return {};

  final pathSegments = CONTEXT.routes[dynamicRoute][PATH_SEGMENT_INDEXES];

  if (pathSegments.isEmpty) return {};

  final list = request.uri.path
      .split('/')
      .where((segment) => segment?.isNotEmpty)
      .toList();

  if (list.isEmpty) return {};

  Map<String, String> mappedValues = {};

  final dynamicPathSegments =
      CONTEXT.routes[dynamicRoute][DYNAMIC_PATH_SEGMENTS];

  for (int index in pathSegments)
    mappedValues.putIfAbsent(
        dynamicPathSegments[index].split(':').last, () => list[index]);

  return mappedValues;
}
