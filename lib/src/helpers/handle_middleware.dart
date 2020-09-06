import 'dart:io';
import 'dart:async';
import '../globals/context.dart';

FutureOr<bool> handleMiddleware(HttpRequest req, HttpResponse res) async {
  FutureOr<bool> result = true;

  if (CONTEXT.middlewares.isNotEmpty)
    await for (var middleware in Stream.fromIterable(CONTEXT.middlewares))
      result = await middleware(req, res);

  return result;
}
