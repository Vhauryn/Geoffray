import 'dart:io';
import '../globals/state.dart';
import '../globals/typedefs.dart';
import 'use_create_http_server.dart';
import 'use_request_handler.dart';

/** 
 * + Creates a new HttpServer 
 * + Binds it to the given host:post 
 * + Handles incoming requests*/
void useHttpServer(String host, int port,
    {int backlog = 0, bool v60only = false, bool shared = false}) async {
  HttpServer server = await useCreateHttpServer(host, port,
      backlog: backlog, v60only: v60only, shared: shared);

  setGzipAutoCompress(server);
  setDefaultResponseHeaders(server);
  useRequestHandler(server);
}

setGzipAutoCompress(HttpServer server) {
  server.autoCompress = true;
  server.defaultResponseHeaders.chunkedTransferEncoding = true;
}

setDefaultResponseHeaders(HttpServer server) {
  if (state[DEFAULT_RESPONSE_HEADERS].isNotEmpty)
    state[DEFAULT_RESPONSE_HEADERS]
        .forEach((key, value) => server.defaultResponseHeaders.add(key, value));
}
