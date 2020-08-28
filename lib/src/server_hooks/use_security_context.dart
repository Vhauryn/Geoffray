import 'dart:io';
import 'package:geoffrey/src/globals/context.dart';
import 'package:meta/meta.dart';
import '../globals/context.dart';

SecurityContext useSecurityContext(
    {@required String cert, @required String pkey, String password}) {
  SecurityContext context = SecurityContext();
  var crt = Platform.script.resolve('certs/$cert').toFilePath();
  var key = Platform.script.resolve('certs/$pkey').toFilePath();

  context.useCertificateChain(crt);
  context.usePrivateKey(key, password: password);

  CONTEXT.httpProtocol = 'https';

  return context;
}
