import 'dart:io';
import '../globals/context.dart';
import '../globals/state.dart';
import '../globals/typedefs.dart';

void usePublicDir(String dir) async {
  await Directory(dir).create(recursive: true);
  contexts[state[CURRENT_CONTEXT]].publicDir = dir;
  state[PUBLIC_DIR] = dir;
}
