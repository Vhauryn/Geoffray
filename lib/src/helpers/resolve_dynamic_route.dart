import 'dart:io';
import '../globals/typedefs.dart';
import 'resolve_method.dart';
import 'dynamic_path_to_values.dart';
import 'dynamic_path_is_valid.dart';

Future<void> resolveDynamicRoute(
    HttpRequest request, String dynamicRoute, method) async {
  Map mappedValues = dynamicPathToValues(request, dynamicRoute);

  if (mappedValues.isNotEmpty && dynamicPathIsValid(request, dynamicRoute))
    await resolveMethod(dynamicRoute, method, request, mappedValues);
  else {
    request.response.statusCode = HttpStatus.notFound;
    request.response.write(HTTP_NOT_FOUND);
  }
}
