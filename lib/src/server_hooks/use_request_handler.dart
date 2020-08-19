import 'dart:io';
import '../globals/state.dart';
import '../globals/typedefs.dart';
import '../helpers/resolve_routes.dart';

/// + Handles incoming requests */
void useRequestHandler(HttpServer server) async {
  String protocol = state[HTTP_PROTOCOL];
  print('serving on $protocol://${server.address.host}:${server.port}');
  await for (HttpRequest request in server)
    resolveRoutes(request, state[ROUTES]);
}
