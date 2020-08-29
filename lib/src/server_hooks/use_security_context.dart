import 'dart:io';
import 'package:meta/meta.dart';

SecurityContext useSecurityContext(
    {@required String cert, @required String pkey, String password}) {
  SecurityContext context = SecurityContext();
  var crt = Platform.script.resolve('certs/$cert').toFilePath();
  var key = Platform.script.resolve('certs/$pkey').toFilePath();

  context.useCertificateChain(crt);
  context.usePrivateKey(key, password: password);

  return context;
}
