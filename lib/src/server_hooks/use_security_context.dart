import 'dart:io';
import 'package:geoffrey/src/globals/context.dart';
import 'package:meta/meta.dart';
import '../globals/state.dart';
import '../globals/typedefs.dart';

SecurityContext useSecurityContext(
    {@required String certificate,
    @required String privateKey,
    String privateKeyPassword}) {

  SecurityContext context = SecurityContext();
  var crt = Platform.script.resolve('certs/$certificate').toFilePath();
  var key = Platform.script.resolve('certs/$privateKey').toFilePath();

  context.useCertificateChain(crt);
  context.usePrivateKey(key, password: privateKeyPassword);

  state[HTTP_PROTOCOL] = 'https';
  contexts[state[CURRENT_CONTEXT]].httpProtocol = 'https';

  return context;
}
