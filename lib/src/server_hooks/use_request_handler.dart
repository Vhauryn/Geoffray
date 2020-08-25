import 'dart:io';
import '../globals/context.dart';
import '../helpers/resolve_routes.dart';

/// + Handles incoming requests */
void useRequestHandler(HttpServer server) async {
  String protocol = State.httpProtocol;
  print('serving on $protocol://${server.address.host}:${server.port}');
  server.listen(resolveRoutes);
}
