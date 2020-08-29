import '../globals/context.dart';
import '../globals/typedefs.dart';

Context useContext([String contextName = DEFAULT]) {
  String name = contextName.toUpperCase();
  Context ctx = contexts.putIfAbsent(name, () => Context(name));
  ctx.server = CONTEXT.server;
  CONTEXT = ctx;

  if (CONTEXT.defaultResponseHeaders.isNotEmpty && CONTEXT.server != null) {
    CONTEXT.server.defaultResponseHeaders.clear();
    DEFAULT_RESPONSE_HEADERS.forEach(CONTEXT.server.defaultResponseHeaders.set);
    CONTEXT.defaultResponseHeaders
        .forEach(CONTEXT.server.defaultResponseHeaders.set);
  }

  return CONTEXT;
}
