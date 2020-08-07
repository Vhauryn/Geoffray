import 'dart:io';
import 'dart:convert';

Future<Map> useJSON(HttpRequest request) async {
  try {
    return request.headers.contentType.mimeType == ContentType.json.mimeType
        ? jsonDecode(await utf8.decoder.bind(request).join())
        : throw Exception('JSON string not valid');
  } catch (error) {
    print(error);
    return {};
  } 
}