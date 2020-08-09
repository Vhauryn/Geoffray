import 'dart:io';
import 'package:mime_type/mime_type.dart' show mime;
import '../globals/state.dart';
import '../globals/typedefs.dart';

Future<dynamic> serveHtmlContent(HttpRequest req) async => req.uri.path == '/'
    ? await mapRootPathToIndexHTml(req)
    : await handleFileRequests(req);

Future<dynamic> mapRootPathToIndexHTml(HttpRequest req) async {
  var index = File('${state[PUBLIC_DIR]}/index.html');
  if (await index.exists()) {
    req.response.headers.contentType = ContentType.html;
    return await req.response.addStream(index.openRead());
  }
}

Future<dynamic> handleFileRequests(HttpRequest req) async {
  final fileName = req.uri.pathSegments.last;
  final index = File('${state[PUBLIC_DIR]}/${req.uri.path}');

  if (!await index.exists())
    return req.response.statusCode = HttpStatus.notFound;

  final mimeType = mime(fileName) ?? 'text/plain; charset=UTF-8';
  req.response.headers.add('content-type', mimeType);
  return await req.response.addStream(index.openRead());
}
