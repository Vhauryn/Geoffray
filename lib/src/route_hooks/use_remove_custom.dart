import '../helpers/remove_route.dart';

useRemoveCustom(String route, String method) =>
    removeRoute(route, method.toUpperCase());
