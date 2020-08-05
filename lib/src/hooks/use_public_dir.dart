// You need to write a small file server from scratch!

import 'dart:io';
import 'package:geoffrey/hooks.dart';

import '../globals/state.dart';
import '../globals/typedefs.dart';

void usePublicDir(String dir) {
  try {
    Directory(dir).createSync(recursive: true);
    contexts[state[CURRENT_CONTEXT]].publicDir = dir; 
    state[PUBLIC_DIR] = dir;
  } catch (e) {}
}
