import 'dart:async';
import 'dart:io';

// Optional params do not work yet : Dart 2.9.0
typedef HandleReqRes = FutureOr<void> Function(HttpRequest req, HttpResponse res);
typedef HandleMiddleware = FutureOr<bool> Function(HttpRequest req, HttpResponse res);
typedef Route = void Function(String method, String path, HandleReqRes reqres,
    HandleMiddleware middleware);

// Enum and map produce an overhead and do not work as desired.
// For map only map['GET'] works but not map.GET so we use constants
// A more elegant solution is welcome
const String PUT = 'PUT',
    GET = 'GET',
    POST = 'POST',
    PATCH = 'PATCH',
    DELETE = 'DELETE',
    REQUEST = 'REQUEST',
    GUARD = 'GUARD',
    DEFAULT = 'DEFAULT',
    HTTPS = 'https';
