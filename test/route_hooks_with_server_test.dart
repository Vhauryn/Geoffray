import 'dart:io' show HttpServer;
import 'package:dio/dio.dart';
import 'package:test/test.dart';
import 'package:geoffrey/hooks.dart'
    show useGet, useDelete, usePatch, usePost, useCustom, useHttpServer;

void main() {
  group('Test Route Hooks With Server', () {
    String home = '/home';
    HttpServer server;
    Dio dio = Dio(BaseOptions(
      baseUrl: "http://localhost:8080",
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ));

    tearDownAll(() async {
      await server.close(force: true);
      dio.close(force: true);
      server = null;
      dio = null;
    });

    setUpAll(() async {
      server = await useHttpServer('localhost', 8080);
      useGet(route: home, handleRequest: (req, res) => res.write('GET'));
      useDelete(route: home, handleRequest: (req, res) => res.write('DELETE'));
      usePatch(route: home, handleRequest: (req, res) => res.write('PATCH'));
      useCustom(
          route: home,
          method: 'x-custom-method',
          handleRequest: (req, res) => res.write('CUSTOM'));
    });
    test('useGet', () async {
      Response response = await dio.get(home);
      expect(response.toString(), equals('GET'));
    });

    test('usePost returns HTTP STATUS 405', () async {
      try {
        await dio.post(home);
      } catch (e) {
        expect((e as DioError).response.toString(),
            equals('HTTP STATUS: 405 - Method Not Allowed'));
      }

      usePost(route: home, handleRequest: (req, res) => res.write('POST'));
      Response response = await dio.post(home);
      expect(response.toString(), equals('POST'));
    });

    test('useDelete', () async {
      Response response = await dio.delete(home);
      expect(response.toString(), equals('DELETE'));
    });

    test('usePatch', () async {
      Response response = await dio.patch(home);
      expect(response.toString(), equals('PATCH'));
    });

    test('useCustom', () async {
      dio.options.method = 'x-custom-method';
      Response response = await dio.request(home);
      expect(response.toString(), equals('CUSTOM'));
    });
  });
}
