import 'dart:io';
import '../globals/typedefs.dart';
import 'resolve_method.dart';
import 'dynamic_path_to_values.dart';
import 'dynamic_path_is_valid.dart';

Future<void> resolveDynamicRoute(
    HttpRequest request, String dynamicRoute, method) async {
  if (!dynamicPathIsValid(request, dynamicRoute)) {
    request.response.statusCode = HttpStatus.notFound;
    return request.response.write(HTTP_NOT_FOUND);
  }

  final mappedValues = dynamicPathToValues(request, dynamicRoute);

  if (mappedValues.isEmpty) {
    request.response.statusCode = HttpStatus.notFound;
    return request.response.write(HTTP_NOT_FOUND);
  }

  await resolveMethod(dynamicRoute, method, request, mappedValues);
}
