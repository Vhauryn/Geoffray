import 'dart:io';

setGzipAutoCompress(HttpServer server) {
  server.autoCompress = true;
  server.defaultResponseHeaders.chunkedTransferEncoding = true;
}