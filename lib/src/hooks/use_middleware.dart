import 'dart:io';
import '../globals/state.dart';
import '../globals/typedefs.dart';

void useMiddleware(void Function(HttpResponse, HttpRequest) func) =>
    state[MIDDLEWARES].add(func);
