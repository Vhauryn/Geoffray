import 'dart:io';
import '../helpers/set_default_response_headers.dart';
import '../helpers/set_gzip_auto_compress.dart';
import '../globals/state.dart';
import '../globals/typedefs.dart';
import '../globals/context.dart';
import 'use_create_secure_http_server.dart';
import 'use_request_handler.dart';

/** 
 * + Creates a new HttpServer 
 * + Secure binds it to the given host:post 
 * + Handles incoming requests
 * + Uses Gzip by default
 * */
Future<HttpServer> useSecureHttpServer(
    String host, int port, SecurityContext sctx,
    {int backlog = 0,
    bool v60only = false,
    bool shared = false,
    bool autoClose}) async {
  HttpServer server = await useCreateSecureHttpServer(host, port, sctx,
      backlog: backlog, v60only: v60only, shared: shared);

  setGzipAutoCompress(server);
  setDefaultResponseHeaders(server);
  useRequestHandler(server);

  if (autoClose != null) {
    state[SHOULD_AUTO_CLOSE] = autoClose;
    contexts[state[CURRENT_CONTEXT]].shouldAutoClose = autoClose;
  }

  return server;
}
