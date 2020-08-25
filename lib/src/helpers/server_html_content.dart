import 'dart:io';
import 'serve_files.dart';
import 'map_root_path_to_index_html.dart';

Future<dynamic> serveHtmlContent(HttpRequest req) {
  return req.uri.path == '/'
      ? mapRootPathToIndexHTml(req)
      : serveFiles(req);
}
