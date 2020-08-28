import 'dart:io';
import 'dart:async';
import '../globals/context.dart';

void useMiddleware(FutureOr<bool> Function(HttpRequest, HttpResponse) func) =>
    CONTEXT.middlewares.add(func);
