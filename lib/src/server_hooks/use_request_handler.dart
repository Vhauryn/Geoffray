import 'dart:io';
import '../globals/state.dart';
import '../globals/typedefs.dart';
import '../handlers/resolve_routes.dart';

/// + Handles incoming requests */
void useRequestHandler(HttpServer server) async {
  print('serving on http://${server.address.host}:${server.port}');
  await for (HttpRequest request in server)
    resolveRoutes(request, state[ROUTES]);
}