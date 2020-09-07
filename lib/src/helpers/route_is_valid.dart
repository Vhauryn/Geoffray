import 'dart:io';
import '../globals/context.dart';
import '../globals/typedefs.dart';

bool routeIsValid(HttpRequest request) {
  final path = request.uri.path;
  return CONTEXT.routes[path] != null && path != ROOT_PATH && path != FAVICON;
}
