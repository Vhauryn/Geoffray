import 'dart:io';
import 'package:geoffrey/src/globals/context.dart';
import 'package:meta/meta.dart';
import '../globals/state.dart';
import '../globals/typedefs.dart';

SecurityContext useSecurityContext(
    {@required String cert,
    @required String pkey,
    String password}) {

  SecurityContext context = SecurityContext();
  var crt = Platform.script.resolve('certs/$cert').toFilePath();
  var key = Platform.script.resolve('certs/$pkey').toFilePath();

  context.useCertificateChain(crt);
  context.usePrivateKey(key, password: password);

  state[HTTP_PROTOCOL] = 'https';
  contexts[state[CURRENT_CONTEXT]].httpProtocol = 'https';

  return context;
}
