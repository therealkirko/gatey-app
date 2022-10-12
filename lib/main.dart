import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gatey/src/pages/login/index.dart';
import 'package:gatey/src/route/index.dart';
import 'package:get/get.dart';

import 'src/theme/index.dart';

String? token;
final _storage = FlutterSecureStorage();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  token = await _storage.read(key: "token");
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
      initialRoute: token == null ? '/' : '/dashboard',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}