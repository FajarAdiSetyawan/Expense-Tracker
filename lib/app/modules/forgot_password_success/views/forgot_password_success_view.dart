import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forgot_password_success_controller.dart';

class ForgotPasswordSuccessView
    extends GetView<ForgotPasswordSuccessController> {
  const ForgotPasswordSuccessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ForgotPasswordSuccessView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ForgotPasswordSuccessView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
