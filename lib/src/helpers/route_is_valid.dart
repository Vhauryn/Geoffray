import '../globals/context.dart';
import '../globals/typedefs.dart';

bool routeIsValid(String path) =>
    CONTEXT.routes[path] != null && path != ROOT_PATH && path != FAVICON;
