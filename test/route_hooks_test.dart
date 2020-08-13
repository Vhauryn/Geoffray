import 'dart:io' show HttpServer;
import 'package:dio/dio.dart';
import 'package:test/test.dart';
import 'package:geoffrey/hooks.dart'
    show useCreateHttpServer, useRequestHandler, useGet, useDelete;

void main() {
  HttpServer server;
  setUp(() async => server = await useCreateHttpServer('localhost', 8080));
  tearDown(() async => await server.close(force: true));

  test('Test useGet', () async {
    useRequestHandler(server);
    useGet(route: '/home', handleRequest: (req, res) => res.write('home'));
    Response response = await Dio().get("http://localhost:8080/home");
    expect(response.toString(), equals('home'));
  });

  test('Test useDelete', () async {
    useRequestHandler(server);
    useDelete(route: '/home', handleRequest: (req, res) => res.write('home'));
    Response response = await Dio().delete("http://localhost:8080/home");
    expect(response.toString(), equals('home'));
  });
}