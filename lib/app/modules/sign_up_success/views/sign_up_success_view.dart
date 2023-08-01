import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sign_up_success_controller.dart';

class SignUpSuccessView extends GetView<SignUpSuccessController> {
  const SignUpSuccessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUpSuccessView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SignUpSuccessView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
