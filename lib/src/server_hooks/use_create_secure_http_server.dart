import 'dart:io';
import '../globals/context.dart';
import '../globals/typedefs.dart';

/// Creates and returns a new HttpServer and bindSecures it to the given host:post */
Future<HttpServer> useCreateSecureHttpServer(
    String host, int port, SecurityContext sctx,
    {int backlog = 0,
    bool v60only = false,
    bool requestClientCertificate = false,
    bool shared = false}) async {
  HttpServer server = await HttpServer.bindSecure(host, port, sctx,
      backlog: backlog,
      v6Only: v60only,
      requestClientCertificate: requestClientCertificate,
      shared: shared);

  CONTEXT.httpProtocol = HTTPS;
  CONTEXT.server = server;
  return server;
}
