import 'dart:io';
import '../globals/context.dart';

Future<dynamic> mapRootPathToIndexHTml(HttpRequest req) async {
  final pathToResolve = '${CONTEXT.publicDir}/index.html';
  final filePath = Platform.script.resolve(pathToResolve).toFilePath();
  final index = File(filePath);

  if (await index.exists()) {
    req.response.headers.contentType = ContentType.html;
    return req.response.addStream(index.openRead());
  }
}
