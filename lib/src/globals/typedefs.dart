import 'dart:async';
import 'dart:io';
import 'request_data.dart';

// Optional params do not work yet : Dart 2.9.0
typedef HandleReqRes = FutureOr<void> Function(
    HttpRequest req, HttpResponse res, RequestData data);
typedef HandleMiddleware = FutureOr<bool> Function(
    HttpRequest req, HttpResponse res);
typedef Route = void Function(String method, String path, HandleReqRes reqres,
    HandleMiddleware middleware);

const Map<String, Object> DEFAULT_RESPONSE_HEADERS = {
  'Content-Type': 'text/plain; charset=utf-8',
  'X-Frame-Options': 'SAMEORIGIN',
  'X-Content-Type-Options': 'nosniff',
  'X-XSS-Protection': '1; mode=block'
};

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
    HTTPS = 'https',
    ROOT_PATH = '/',
    FAVICON = '/favicon.ico',
    PATH_SEGMENT_INDEXES = 'PATH_SEGMENT_INDEXES',
    DYNAMIC_PATH_SEGMENTS = 'DYNAMIC_PATH_SEGMENTS',
    HTTP_UNPROCESSABLE_ENTITY = 'HTTP STATUS: 422 - Unprocessable Entity',
    HTTP_NOT_FOUND = 'HTTP STATUS: 404 - Not Found',
    HTTP_METHOD_NOT_ALLOWED = 'HTTP STATUS: 405 - Method Not Allowed';
