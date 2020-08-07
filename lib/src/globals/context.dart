import 'dart:io';
import 'dart:collection';
import 'typedefs.dart';

Map<String, Context> contexts = Map.from({DEFAULT: Context(DEFAULT)});

class Context {
  String _ctxName;
  Context(this._ctxName);
  String _publicDir;
  Set<Function(HttpResponse, HttpRequest)> _middlewares = Set();
  HashMap<String, HashMap<String, Map<String, Function>>> _routes = HashMap();
  Map<String, Object> _defaultResponseHeaders = Map();
  get middlewares => this._middlewares;
  get routes => this._routes;
  set routes(var routes) => this._routes = routes;
  get defaultResponseHeaders => this._defaultResponseHeaders;
  get publicDir => this._publicDir;
  get ctxName => this._ctxName;
  set ctxName(String newCtxName) => this._ctxName = newCtxName;
  set publicDir(String newPublicDir) => this._publicDir = newPublicDir;
}
