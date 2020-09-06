import 'dart:io';
import '../globals/context.dart';
import '../globals/typedefs.dart';

Map<String, String> dynamicPathToValues(
    HttpRequest request, String dynamicRoute) {
  if (CONTEXT.routes[dynamicRoute][PATH_SEGMENT_INDEXES].isEmpty) return {};

  Map<String, String> mappedValues = {};

  List<String> dynamicPathSegments =
      CONTEXT.routes[dynamicRoute][DYNAMIC_PATH_SEGMENTS];

  List<String> list =
      request.uri.path.split('/').where((str) => str?.isNotEmpty).toList();

  for (int index in CONTEXT.routes[dynamicRoute][PATH_SEGMENT_INDEXES])
    if (list.isNotEmpty)
      mappedValues.putIfAbsent(
          dynamicPathSegments[index].split(':').last, () => list[index]);

  return mappedValues;
}
