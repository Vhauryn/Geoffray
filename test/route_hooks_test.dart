import 'dart:io' show HttpServer;
import 'package:dio/dio.dart';
import 'package:test/test.dart';
import 'package:geoffrey/hooks.dart'
    show
        useGet,
        useDelete,
        usePatch,
        usePost,
        useHead,
        useCustom,
        useHttpServer;

void main() {
  HttpServer server;
  Dio dio = new Dio(BaseOptions(
    baseUrl: "http://localhost:8080",
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ));

  group('Test HTTP Routes', () {
    tearDownAll(() async => await server.close(force: true));
    setUpAll(() async {
      server = await useHttpServer('localhost', 8080);
      useGet(route: '/home', handleRequest: (req, res) => res.write('1'));
      usePost(route: '/home', handleRequest: (req, res) => res.write('2'));
      useDelete(route: '/home', handleRequest: (req, res) => res.write('3'));
      usePatch(route: '/home', handleRequest: (req, res) => res.write('4'));
      useHead(route: '/home', handleRequest: (req, res) => res.write('5'));
      useCustom(
          route: '/home',
          method: 'x-custom-method',
          handleRequest: (req, res) => res.write('6'));
    });
    test('useGet', () async {
      Response response = await dio.get("/home");
      expect(response.toString(), equals('1'));
    });

    test('usePost', () async {
      Response response = await dio.post("/home");
      expect(response.toString(), equals('2'));
    });

    test('useDelete', () async {
      Response response = await dio.delete("/home");
      expect(response.toString(), equals('3'));
    });

    test('usePatch', () async {
      Response response = await dio.patch("/home");
      expect(response.toString(), equals('4'));
    });

    test('useHead', () async {
      Response response = await dio.head("/home");
      expect(response.toString(), equals(''));
    });

    test('useCustom', () async {
      dio.options.method = 'x-custom-method';
      Response response = await dio.request("/home");
      expect(response.toString(), equals('6'));
    });
  });
}
