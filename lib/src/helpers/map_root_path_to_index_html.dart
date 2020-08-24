import 'dart:io';
import '../globals/context.dart';

Future<dynamic> mapRootPathToIndexHTml(HttpRequest req) async {
  var index = File('${State.publicDir}/index.html');

  if (await index.exists()) {
    req.response.headers.contentType = ContentType.html;
    return await req.response.addStream(index.openRead());
  }
}
