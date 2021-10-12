
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/modules/abp/screens/introduction/introduction_screen.dart';

var introductionHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return IntroductionScreen();
    });
