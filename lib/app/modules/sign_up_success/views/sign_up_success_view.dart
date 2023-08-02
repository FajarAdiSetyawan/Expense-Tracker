import 'package:expense/app/core/constants/const_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sign_up_success_controller.dart';

class SignUpSuccessView extends GetView<SignUpSuccessController> {
  const SignUpSuccessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset('assets/images/ic_success.png'),
            ),
            Text(
              'lbl_you_are_set'.tr,
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
