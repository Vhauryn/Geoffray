import 'dart:io';
import 'dart:async';
import '../globals/context.dart';

FutureOr<bool> handleMiddleware(HttpRequest req, HttpResponse res) async {
  FutureOr<bool> result = true;

  if (CONTEXT.middlewares.isNotEmpty)
    await for (var mid in Stream.fromIterable(CONTEXT.middlewares))
      result = await mid(req, res);

  return result;
}
