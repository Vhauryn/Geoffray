import 'dart:io';
import '../globals/context.dart';

bool handleMiddleware(HttpRequest req, HttpResponse res) =>
    State.middlewares.isNotEmpty
        ? State.middlewares.every((middleware) => middleware(req, res))
        : true;
