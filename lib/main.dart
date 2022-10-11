import 'package:flutter/material.dart';
import 'package:gatey/src/pages/login/index.dart';
import 'package:get/get.dart';

import 'src/theme/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: mainColor,
        focusColor: mainColor,
        hoverColor: mainColor
      ),
      home: LoginScreen(),
    );
  }
}