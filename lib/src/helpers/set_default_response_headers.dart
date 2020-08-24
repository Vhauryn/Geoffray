import 'dart:io';
import '../globals/context.dart';

setDefaultResponseHeaders(HttpServer server) {
  if (State.defaultResponseHeaders.isNotEmpty)
    State.defaultResponseHeaders
        .forEach((key, value) => server.defaultResponseHeaders.add(key, value));
}
