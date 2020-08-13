import 'package:dio/dio.dart';
import 'package:geoffrey/hooks.dart' show useHttpServer, usePost;
import 'package:test/test.dart';

void main() {
  test('Test usePost', () async {
    try {
      useHttpServer('localhost', 8080);

      usePost(
          route: '/home',
          handleRequest: (req, res) => res.write('hello'),
          handleGuard: (req, res) => true); // optional
      Response response = await Dio().post("http://localhost:8080/home");
      expect(response.toString(), equals('hello'));
    } catch (e) {
      print(e);
    }
  });
}
