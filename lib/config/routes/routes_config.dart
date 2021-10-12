import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/constants/route_path.dart';

import 'routes_handler.dart';

class Routes {
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      // return Error404Screen();
    });
    router.define(RoutesPath.introduction, handler: introductionHandler);
  }
}
