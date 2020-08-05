import '../globals/typedefs.dart';
import '../globals/state.dart';

void useDefaultResponseHeaders(Map<String, Object> defResHeaders) =>
    state[DEFAULT_RESPONSE_HEADERS] = {
      ...state[DEFAULT_RESPONSE_HEADERS],
      ...defResHeaders
    };
