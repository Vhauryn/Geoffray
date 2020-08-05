import 'dart:io';

/// Creates and returns a new HttpServer and binds it to the given host:post */
Future<HttpServer> useHttpServer(String host, int port,
        {int backlog = 0, bool v60only = false, bool shared = false}) async =>
    await HttpServer.bind(host, port,
        backlog: backlog, v6Only: v60only, shared: shared);
