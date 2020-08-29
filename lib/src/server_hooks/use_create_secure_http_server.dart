import 'dart:io';
import '../globals/context.dart';

/// Creates and returns a new HttpServer and bindSecures it to the given host:post */
Future<HttpServer> useCreateSecureHttpServer(
    String host, int port, SecurityContext sctx,
    {int backlog = 0,
    bool v60only = false,
    bool requestClientCertificate = false,
    bool shared = false}) {
  CONTEXT.httpProtocol = 'https';
  return HttpServer.bindSecure(host, port, sctx,
      backlog: backlog,
      v6Only: v60only,
      requestClientCertificate: requestClientCertificate,
      shared: shared);
}
