import 'dart:io';
import 'use_create_secure_http_server.dart';
import 'use_request_handler.dart';
import '../helpers/set_default_response_headers.dart';

/** 
 * + Creates a new HttpServer 
 * + Secure binds it to the given host:post 
 * + Handles incoming requests*/
Future<HttpServer> useSecureHttpServer(String host, int port, SecurityContext sctx,
    {int backlog = 0, bool v60only = false, bool shared = false}) async {
  HttpServer server = await useCreateSecureHttpServer(host, port, sctx,
      backlog: backlog, v60only: v60only, shared: shared);

  setDefaultResponseHeaders(server);
  useRequestHandler(server);

  return server;
}

