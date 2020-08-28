import 'dart:io';
import '../globals/context.dart';

void usePublicDir(String dir) {
  Directory(dir).createSync(recursive: true);
  CONTEXT.publicDir = dir;
}
