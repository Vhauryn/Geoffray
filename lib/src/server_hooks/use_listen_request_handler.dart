import 'dart:io';
import '../globals/state.dart';
import '../globals/typedefs.dart';
import '../helpers/handle_routes.dart';

/// + Handles incoming requests */
void useListenRequestHandler(HttpServer server) async {
  print('serving on http://${server.address.host}:${server.port}');
  await for (HttpRequest request in server)
    handleRoutes(request, state[ROUTES]);
}
