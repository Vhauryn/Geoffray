import 'dart:io';
import '../helpers/decode_json.dart';
import '../globals/request_data.dart';
import '../helpers/dynamic_route_exists.dart';
import '../helpers/dynamic_route_to_values.dart';

Future<RequestData> useRequestData(HttpRequest request) async {
  final dynamicRoute = dynamicRouteExists(request);
  final dynamicParams = dynamicRouteToValues(request, dynamicRoute);
  final queryParams = request.uri.queryParameters;
  final jsonParams = await useJSON(request);

  return RequestData(
      queryParams: queryParams,
      jsonParams: jsonParams,
      dynamicParams: dynamicParams);
}
