import 'dart:io';
import 'dart:async';
import '../globals/context.dart';

FutureOr<bool> handleMiddleware(HttpRequest req, HttpResponse res) async {
  FutureOr<bool> result = false;

  await for (var mid in Stream.fromIterable(State.middlewares))
    result = await mid(req, res);

  return result;
}
