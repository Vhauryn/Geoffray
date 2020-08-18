import 'dart:io';
import '../globals/state.dart';
import '../globals/typedefs.dart';

setDefaultResponseHeaders(HttpServer server) {
  if (state[DEFAULT_RESPONSE_HEADERS].isNotEmpty)
    state[DEFAULT_RESPONSE_HEADERS]
        .forEach((key, value) => server.defaultResponseHeaders.add(key, value));
}