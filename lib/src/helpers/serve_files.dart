import 'dart:io';
import 'package:mime_type/mime_type.dart' show mime;
import '../globals/state.dart';
import '../globals/typedefs.dart';

Future<dynamic> serveFiles(HttpRequest req) async {
  final fileName = req.uri.pathSegments.last;
  final index = File('${state[PUBLIC_DIR]}/${req.uri.path}');

  if (!await index.exists())
    return req.response.statusCode = HttpStatus.notFound;

  final mimeType = mime(fileName) ?? 'text/plain; charset=UTF-8';
  req.response.headers.add('content-type', mimeType);
  return await req.response.addStream(index.openRead());
}
