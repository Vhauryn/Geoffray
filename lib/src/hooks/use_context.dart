import '../globals/context.dart';
import '../globals/typedefs.dart';

Context useContext([String contextName = DEFAULT]) =>
    contexts.putIfAbsent(contextName, () => Context(contextName));
