import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/modules/sign_up_verification/widget/sign_up_verification_widget.dart';
import 'package:expense/app/routes/app_pages.dart';
import 'package:expense/app/theme/custom_button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async';

import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class SignUpVerificationView extends StatefulWidget {
  const SignUpVerificationView({Key? key}) : super(key: key);

  @override
  _SignUpVerificationViewState createState() => _SignUpVerificationViewState();
}

class _SignUpVerificationViewState extends State<SignUpVerificationView> {
  late Timer _timer;
  int currentSeconds = 5 * 60; // 5 minutes in seconds

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (currentSeconds <= 0) {
        // Countdown finished, do something
        timer.cancel();
      } else {
        setState(() {
          currentSeconds--;
        });
      }
    });
  }

  String formatTime(int seconds) {
    int minutes = (seconds / 60).floor();
    int remainingSeconds = seconds % 60;

    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');

    return '$minutesStr:$secondsStr';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'lbl_verification'.tr,
        ),
        centerTitle: true,
        leading: GestureDetector(
          child: Transform.scale(
            scale: 0.7,
            child: SvgPicture.asset(
              'assets/icons/ic_arrows_left.svg',
            ),
          ),
          onTap: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'msg_enter_your_verification'.tr,
                  style: const TextStyle(
                    fontFamily: "Inter",
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Pinput(
                  autofocus: true,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  validator: (s) {
                    return s == '123123' ? null : 'Pin is incorrect';
                  },
                  followingPinTheme: followingPinTheme,
                  showCursor: false,
                  length: 6,
                  keyboardType: TextInputType.number,
                  pinAnimationType: PinAnimationType.scale,
                  closeKeyboardWhenCompleted: true,
                  useNativeKeyboard: true,
                  toolbarEnabled: true,
                  onCompleted: (pin) => print(pin),
                  errorPinTheme: errorPinTheme,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  formatTime(currentSeconds),
                  style: TextStyle(
                    color: violet100,
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "msg_we_send_verification2".tr,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: "fajar****@gmail.com",
                        style: TextStyle(
                          color: violet100,
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "msg_you_can_check".tr,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "msg_i_didn_t_received".tr,
                  style: TextStyle(
                    color: violet100,
                    decoration: TextDecoration.underline,
                    decorationColor: violet100,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Inter",
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  title: "lbl_verify".tr,
                  colorBg: violet100,
                  colorText: violet20,
                  colorRipple: dark75,
                  width: 400,
                  onPressed: () => Get.toNamed(Routes.SETUP_PIN),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
