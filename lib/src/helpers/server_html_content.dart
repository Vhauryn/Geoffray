import 'dart:io';
import 'package:mime_type/mime_type.dart' show mime;
import '../globals/state.dart';
import '../globals/typedefs.dart';

// todo: improve i/o on disc
// todo: keep files in cache and only reload if file changed
Future<dynamic> serveHtmlContent(HttpRequest req) async => req.uri.path == '/'
    ? await rootPathToIndexHTml(req)
    : await handleFileRequests(req);

Future<dynamic> rootPathToIndexHTml(HttpRequest req) async {
  var index = File('${state[PUBLIC_DIR]}/index.html');
  if (await index.exists()) {
    req.response.headers.contentType = ContentType.html;
    return await req.response.addStream(index.openRead());
  }
}

Future<dynamic> handleFileRequests(HttpRequest req) async {
  final fileName = req.uri.pathSegments.last;
  final index = File('${state[PUBLIC_DIR]}/${fileName}');
  final mimeType = mime(fileName) ?? 'text/plain; charset=UTF-8';
  req.response.headers.add('content-type', mimeType);
  return await index.exists()
      ? await req.response.addStream(index.openRead())
      : req.response.statusCode = HttpStatus.notFound;
}

// handle e-tag by watching the file for changes
// if file changed serve file else httpstatus 304

// handle gzip to reduce transmitting file size 