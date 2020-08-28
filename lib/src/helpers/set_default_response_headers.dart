import 'dart:io';
import '../globals/context.dart';

setDefaultResponseHeaders(HttpServer server) {
  if (CONTEXT.defaultResponseHeaders.isNotEmpty)
    CONTEXT.defaultResponseHeaders
        .forEach((key, value) => server.defaultResponseHeaders.add(key, value));
}
