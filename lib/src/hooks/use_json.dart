import 'dart:io';
import 'dart:convert';

Future<Map> useJSON(HttpRequest request) async {
  try {
    if (request.headers.contentType == null) return {};
    return request.headers.contentType.mimeType == ContentType.json.mimeType
        ? jsonDecode(await utf8.decoder.bind(request).join())
        : throw Exception('Could not parse JSON');
  } catch (error) {
    print(error);
    return {};
  }
}
