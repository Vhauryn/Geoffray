import 'dart:io';
import '../globals/context.dart';
import '../globals/typedefs.dart';

Map<String, String> dynamicPathToValues(
    HttpRequest request, String dynamicRoute) {
  if (CONTEXT.routes[dynamicRoute][PATH_SEGMENT_INDEXES].isEmpty) return {};

  final list =
      request.uri.path.split('/').where((str) => str?.isNotEmpty).toList();

  if (list.isEmpty) return {};

  Map<String, String> mappedValues = {};

  final dynamicPathSegments =
      CONTEXT.routes[dynamicRoute][DYNAMIC_PATH_SEGMENTS];

  for (int index in CONTEXT.routes[dynamicRoute][PATH_SEGMENT_INDEXES])
    mappedValues.putIfAbsent(
        dynamicPathSegments[index].split(':').last, () => list[index]);

  return mappedValues;
}
