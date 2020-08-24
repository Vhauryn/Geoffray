import '../globals/context.dart';

void useDefaultResponseHeaders(Map<String, Object> defResHeaders) =>
    State.defaultResponseHeaders = {
      ...State.defaultResponseHeaders,
      ...defResHeaders
    };
