import 'dart:io';
import 'package:mime_type/mime_type.dart' show mime;
import '../globals/context.dart';
import '../globals/typedefs.dart';

Future<dynamic> serveFiles(HttpRequest req) async {
  final fileName = req.uri.pathSegments.last;
  final pathToResolve = '${CONTEXT.publicDir}${req.uri.path}';
  final toFilePath = Platform.script.resolve(pathToResolve).toFilePath();
  final index = File(toFilePath);

  if (!await index.exists()) {
    req.response.statusCode = HttpStatus.notFound;
    return req.response.write(HTTP_NOT_FOUND);
  }

  final mimeType = mime(fileName) ?? 'text/plain; charset=UTF-8';
  req.response.headers.add('content-type', mimeType);
  return req.response.addStream(index.openRead());
}
