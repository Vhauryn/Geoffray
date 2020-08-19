import 'dart:io';

bool handleMiddleware(HttpRequest req, HttpResponse res,
        Set<bool Function(HttpRequest, HttpResponse)> Middlewares) =>
    Middlewares.every((middleware) => middleware(req, res));
