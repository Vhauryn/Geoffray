import '../globals/context.dart';

void useDefaultResponseHeaders(Map<String, Object> defResHeaders) =>
    defResHeaders.forEach(CONTEXT.server.defaultResponseHeaders.set);
