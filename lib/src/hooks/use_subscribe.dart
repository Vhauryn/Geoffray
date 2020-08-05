import '../globals/state.dart';
import '../globals/context.dart';
import '../globals/typedefs.dart';

void useSubscribe(Context ctx) {
  state[MIDDLEWARES] = ctx.middlewares;
  state[ROUTES] = ctx.routes;
  state[DEFAULT_RESPONSE_HEADERS] = ctx.defaultResponseHeaders;
  state[PUBLIC_DIR] = ctx.publicDir;
  state[CURRENT_CONTEXT] = ctx.ctxName;
}