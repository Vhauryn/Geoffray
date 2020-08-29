import 'dart:io';
import '../globals/context.dart';

/// Creates and returns a new HttpServer and binds it to the given host:post */
Future<HttpServer> useCreateHttpServer(String host, int port,
    {int backlog = 0, bool v60only = false, bool shared = false}) async {
  HttpServer server = await HttpServer.bind(host, port,
      backlog: backlog, v6Only: v60only, shared: shared);

  CONTEXT.server = server;
  return server;
}
