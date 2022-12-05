import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color(0xff04214B),
          body: Center(
              child: Container(
            width: Get.width * 0.5,
            height: Get.width * 0.5,
            child: Image.asset("assets/logo/Logo.png"),
          )),
        ));
  }
}
