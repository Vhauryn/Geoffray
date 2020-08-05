import 'dart:io';

// optional params do not work yet : Dart 2.8.4
typedef HandleReqRes = void Function(HttpRequest req, HttpResponse res);
typedef HandleMiddleware = bool Function(HttpRequest req, HttpResponse res);

// enum and map produce an overhead and do not work as desired
// for map only map['GET'] works but not map.GET so better use constants
// a more elegant solution is welcome
const String PUT = 'PUT',
    GET = 'GET',
    POST = 'POST',
    PATCH = 'PATCH',
    HEAD = 'HEAD',
    OPTIONS = 'OPTIONS',
    DELETE = 'DELETE',
    REQUEST = 'REQUEST',
    GUARD = 'GUARD',
    MIDDLEWARES = 'MIDDLEWARES',
    ROUTES = 'ROUTES',
    DEFAULT_RESPONSE_HEADERS = 'DEFAULT_RESPONSE_HEADERS',
    DEFAULT = 'DEFAULT',
    CONTEXTS = 'CONTEXTS',
    CURRENT_CONTEXT = 'CURRENT_CONTEXT',
    PUBLIC_DIR = 'PUBLIC_DIR';
