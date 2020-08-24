import '../globals/context.dart';
import '../globals/typedefs.dart';

Context useContext([String contextName = DEFAULT]) {
  String name = contextName.toUpperCase();
  return contexts.putIfAbsent(name, () => Context(name));
}
