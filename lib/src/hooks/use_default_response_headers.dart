import '../globals/context.dart';

void useDefaultResponseHeaders(Map<String, Object> defResHeaders) =>
    CONTEXT.defaultResponseHeaders = {
      ...CONTEXT.defaultResponseHeaders,
      ...defResHeaders
    };
