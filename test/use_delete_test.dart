import 'dart:io' show HttpServer;
import 'package:dio/dio.dart';
import 'package:test/test.dart';
import 'package:geoffrey/hooks.dart'
    show useCreateHttpServer, useRequestHandler, useDelete;

void main() {
  test('Test useDelete', () async {
    HttpServer server = await useCreateHttpServer('localhost', 8080);
    useRequestHandler(server);
    useDelete(route: '/home', handleRequest: (req, res) => res.write('delete'));
    Response response = await Dio().delete("http://localhost:8080/home");
    expect(response.toString(), equals('delete'));
    await server.close(force: true);
  });
}

// You can use the setUp() and tearDown() functions to share code between tests.
// The setUp() callback will run before every test in a group or test suite,
// and tearDown() will run after. tearDown() will run even if a test fails,
// to ensure that it has a chance to clean up after itself.

/*
import 'package:test/test.dart';

void main() {
  HttpServer server;
  Uri url;
  setUp(() async {
    server = await HttpServer.bind('localhost', 0);
    url = Uri.parse('http://${server.address.host}:${server.port}');
  });

  tearDown(() async {
    await server.close(force: true);
    server = null;
    url = null;
  });

  // ...
}
*/
