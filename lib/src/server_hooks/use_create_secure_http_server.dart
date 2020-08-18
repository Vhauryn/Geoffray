import 'dart:io';
import 'package:geoffrey/src/globals/context.dart';
import 'package:meta/meta.dart';
import '../globals/state.dart';
import '../globals/typedefs.dart';

/// Creates and returns a new SecureHttpServer and binds it to the given host:post */
Future<HttpServer> useCreateSecureHttpServer(String host, int port,
    {int backlog = 0,
    bool v60only = false,
    bool requestClientCertificate = false,
    bool shared = false}) {
  var sctx = useCertificates(certificate: 'cert.pem', privateKey: 'key.pem');

  return HttpServer.bindSecure(host, port, sctx,
      backlog: backlog,
      v6Only: v60only,
      requestClientCertificate: requestClientCertificate,
      shared: shared);
}

SecurityContext useCertificates(
    {@required String certificate,
    @required String privateKey,
    String privateKeyPassword}) {
  SecurityContext context = SecurityContext();
  var crt = Platform.script.resolve('certificates/$certificate').toFilePath();
  var key = Platform.script.resolve('certificates/$privateKey').toFilePath();

  context.useCertificateChain(crt);
  context.usePrivateKey(key, password: privateKeyPassword);

  state[HTTP_PROTOCOL] = 'https';
  contexts[state[CURRENT_CONTEXT]].httpProtocol = 'https';

  return context;
}
