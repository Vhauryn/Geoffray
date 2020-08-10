import 'dart:io';
import '../globals/state.dart';
import '../globals/typedefs.dart';

void useMiddleware(bool Function(HttpRequest, HttpResponse) func) =>
    state[MIDDLEWARES].add(func);
