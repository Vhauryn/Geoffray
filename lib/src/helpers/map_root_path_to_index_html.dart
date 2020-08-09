import 'dart:io';
import '../globals/state.dart';
import '../globals/typedefs.dart';

Future<dynamic> mapRootPathToIndexHTml(HttpRequest req) async {
  var index = File('${state[PUBLIC_DIR]}/index.html');
  if (await index.exists()) {
    req.response.headers.contentType = ContentType.html;
    return await req.response.addStream(index.openRead());
  }
}