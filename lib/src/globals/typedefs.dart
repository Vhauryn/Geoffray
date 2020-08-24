import 'dart:io';

// Optional params do not work yet : Dart 2.9.0
typedef HandleReqRes = void Function(HttpRequest req, HttpResponse res);
typedef HandleMiddleware = bool Function(HttpRequest req, HttpResponse res);

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
    DEFAULT = 'DEFAULT';
