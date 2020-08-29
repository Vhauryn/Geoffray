import '../globals/context.dart';

void useDefaultResponseHeaders(Map<String, Object> defResHeaders) {
  CONTEXT.defaultResponseHeaders.addEntries(defResHeaders.entries);

  if (CONTEXT.server != null)
    defResHeaders.forEach(CONTEXT.server.defaultResponseHeaders.set);
}
