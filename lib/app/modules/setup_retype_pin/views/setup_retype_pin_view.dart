import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_plus_keyboard/package/controllers/pin_input_controller.dart';
import 'package:pin_plus_keyboard/package/pin_plus_keyboard_package.dart';

import '../controllers/setup_retype_pin_controller.dart';

class SetupRetypePinView extends GetView<SetupRetypePinController> {
  const SetupRetypePinView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pinInputController = PinInputController(length: 4);

    return Scaffold(
      backgroundColor: violet100,
      appBar: AppBar(
        title: Text(
          'msg_ok_re_type_your'.tr,
          style: TextStyle(
            fontFamily: 'Intel',
            color: light100,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        surfaceTintColor: violet100,
        backgroundColor: violet100,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              PinPlusKeyBoardPackage(
                keyboardButtonShape: KeyboardButtonShape.circular,
                inputShape: InputShape.circular,
                inputHasBorder: true,
                inputFillColor: violet100,
                inputBorderThickness: 5,
                inputBorderColor: Colors.white12,
                btnTextColor: Colors.white,
                buttonBorderColor: violet100,
                keyboardVerticalSpacing: 20,
                keyboardFontSize: 40,
                inputWidth: 30,
                keyboardMaxWidth: 120,
                inputHiddenColor: violet20,
                isInputHidden: true,
                spacing: 200,
                backButton: const Icon(
                  Icons.backspace_outlined,
                  color: Colors.white,
                  size: 40,
                ),
                doneButton: const Icon(
                  Icons.done_rounded,
                  color: Colors.white,
                  size: 40,
                ),
                errorColor: violet20,
                keyboardFontFamily: "Inter",
                pinInputController: pinInputController,
                onSubmit: () {
                  // print("Text is : " + pinInputController.text);
                  if (pinInputController.text != controller.pin) {
                    return Get.defaultDialog(
                      titlePadding: EdgeInsets.all(20),
                      title: 'Pin Error',
                      titleStyle: TextStyle(
                        color: dark100,
                        fontFamily: "Inter",
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      ),
                      content: Text(
                        'PIN are not the same',
                        style: TextStyle(
                          color: dark100,
                          fontFamily: "Inter",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }
                  Get.toNamed(Routes.SETUP_ACCOUNT);
                },
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
