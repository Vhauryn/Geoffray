import 'dart:io';
import 'package:geoffrey/hooks.dart';
import '../globals/context.dart';
import '../helpers/resolve_routes.dart';

/// + Handles incoming requests */
Future<void> useRequestHandler(HttpServer server) async {
  String protocol = CONTEXT.httpProtocol;
  print('serving on $protocol://${server.address.host}:${server.port}');
  server.listen(resolveRoutes);
}
