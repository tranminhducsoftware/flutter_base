
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/core/modules/introduction/screens/introduction_screen.dart';

var introductionHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return IntroductionScreen();
    });
