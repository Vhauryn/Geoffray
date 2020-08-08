import 'dart:io';
import '../globals/context.dart';
import '../globals/state.dart';
import '../globals/typedefs.dart';

void usePublicDir(String dir) {
  Directory(dir).createSync(recursive: true);
  contexts[state[CURRENT_CONTEXT]].publicDir = dir;
  state[PUBLIC_DIR] = dir;
}
