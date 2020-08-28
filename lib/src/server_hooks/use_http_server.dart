import 'dart:io';
import '../helpers/set_default_response_headers.dart';
import '../helpers/set_gzip_auto_compress.dart';
import '../globals/context.dart';
import 'use_create_http_server.dart';
import 'use_request_handler.dart';

/** 
 * + Creates a new HttpServer 
 * + Binds it to the given host:post 
 * + Handles incoming requests
 * + Uses Gzip by default
 * */
Future<HttpServer> useHttpServer(String host, int port,
    {int backlog = 0,
    bool v60only = false,
    bool shared = false,
    bool autoClose = true}) async {
  HttpServer server = await useCreateHttpServer(host, port,
      backlog: backlog, v60only: v60only, shared: shared);

  setGzipAutoCompress(server);
  setDefaultResponseHeaders(server);
  useRequestHandler(server);

  if (autoClose != null) CONTEXT.shouldAutoClose = autoClose;

  return server;
}
