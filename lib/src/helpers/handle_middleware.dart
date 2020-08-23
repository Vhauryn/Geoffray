import 'dart:io';
import '../globals/typedefs.dart';
import '../globals/state.dart';

bool handleMiddleware(HttpRequest req, HttpResponse res) =>
    state[MIDDLEWARES].isNotEmpty
        ? state[MIDDLEWARES].every((middleware) => middleware(req, res))
        : true;
