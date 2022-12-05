import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LoginScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
