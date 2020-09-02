import 'dart:io';
import 'package:mime_type/mime_type.dart' show mime;
import '../globals/context.dart';

Future<dynamic> serveFiles(HttpRequest req) async {
  final fileName = req.uri.pathSegments.last;
  final pathToResolve = '${CONTEXT.publicDir}${req.uri.path}';
  final toFilePath = Platform.script.resolve(pathToResolve).toFilePath();
  final index = File(toFilePath);

  if (!await index.exists())
    return req.response.statusCode = HttpStatus.notFound;

  final mimeType = mime(fileName) ?? 'text/plain; charset=UTF-8';

  req.response.headers.add('content-type', mimeType);
  return req.response.addStream(index.openRead());
}
