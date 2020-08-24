import 'dart:io';
import '../globals/context.dart';

void useMiddleware(bool Function(HttpRequest, HttpResponse) func) =>
    State.middlewares.add(func);
