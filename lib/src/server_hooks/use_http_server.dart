import 'dart:io';
import 'use_create_http_server.dart';
import 'use_request_handler.dart';
import '../helpers/set_gzip_auto_compress.dart';
import '../helpers/set_default_response_headers.dart';

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

