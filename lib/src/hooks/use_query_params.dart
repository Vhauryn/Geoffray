import 'dart:io';

Map<String, String> useQueryParams(HttpRequest request) =>
    request.uri.queryParameters;
