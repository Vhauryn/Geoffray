import 'dart:io';
import '../globals/context.dart';
import '../globals/typedefs.dart';

bool dynamicPathIsValid(HttpRequest request, String dynamicRoute) {
  if (request.uri.pathSegments.length !=
      CONTEXT.routes[dynamicRoute][DYNAMIC_PATH_SEGMENTS].length) return false;

  bool dynamicPathIsValid = true;

  for (String item in CONTEXT.routes[dynamicRoute][DYNAMIC_PATH_SEGMENTS])
    if (item.startsWith(':') || request.uri.pathSegments.contains(item))
      continue;
    else
      dynamicPathIsValid = false;

  return dynamicPathIsValid;
}
