import 'package:dio/dio.dart';
import 'package:geoffrey/hooks.dart'
    show useHttpServer, useGet, usePost, useCustom;
import 'package:test/test.dart';

void main() {
  test('Test useGet', () async {
    try {
      useHttpServer('localhost', 8080);

      useGet(
          route: '/home',
          handleRequest: (req, res) => res.write('hello'),
          handleGuard: (req, res) => true); // optional
      Response response = await Dio().get("http://localhost:8080/home");
      expect(response.toString(), equals('hello'));
    } catch (e) {
      print(e);
    }
  });
}
