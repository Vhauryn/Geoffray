import 'context.dart';
import 'typedefs.dart';

Map<String, dynamic> state = {
  MIDDLEWARES: contexts[DEFAULT].middlewares,
  ROUTES: contexts[DEFAULT].routes,
  DEFAULT_RESPONSE_HEADERS: contexts[DEFAULT].defaultResponseHeaders,
  PUBLIC_DIR: contexts[DEFAULT].publicDir,
  CURRENT_CONTEXT: contexts[DEFAULT].ctxName,
  HTTP_PROTOCOL: contexts[DEFAULT].httpProtocol,
  SHOULD_AUTO_CLOSE: contexts[DEFAULT].shouldAutoClose
};
