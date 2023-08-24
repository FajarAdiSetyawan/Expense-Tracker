import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/theme/custom_bottom_dialog.dart';
import 'package:expense/app/theme/custom_button_style.dart';
import 'package:expense/app/theme/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/create_budget_controller.dart';

class CreateBudgetView extends GetView<CreateBudgetController> {
  const CreateBudgetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue100,
      appBar: AppBar(
        title: Text(
          'lbl_create_budget'.tr,
          style: const TextStyle(
            fontFamily: 'Intel',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
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
        surfaceTintColor: blue100,
        backgroundColor: blue100,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 20,
                right: 20,
              ),
              child: Text(
                'lbl_balance'.tr,
                style: const TextStyle(
                  color: Colors.white70,
                  fontFamily: "Inter",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20),
              child: TextFiledBalance(
                hintText: '\$ 0.00',
                autofocus: false,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DropDownTextFieldCustom(
                            hintText: 'lbl_wallet'.tr,
                            dropDownValueModel: const [
                              DropDownValueModel(
                                name: 'Bank',
                                value: 'Bank',
                              ),
                              DropDownValueModel(
                                name: 'E wallet',
                                value: 'E wallet',
                              ),
                              DropDownValueModel(
                                name: 'Paypal',
                                value: 'Paypal',
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'lbl_repeat'.tr,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text('msg_repeat_transaction'.tr),
                                ],
                              ),
                              Obx(
                                () => Switch(
                                  // This bool value toggles the switch.
                                  value: controller.isSelected.value,
                                  splashRadius: 10,
                                  activeTrackColor: violet80,
                                  thumbColor: const MaterialStatePropertyAll<Color>(Colors.white),
                                  onChanged: (bool value) {
                                    // This is called when the user toggles the switch.
                                    controller.isSelected.value = value;
                                  },
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(
                            () => Container(
                              child: controller.isSelected.isTrue
                                  ? Slider(
                                      min: 0,
                                      max: 100,
                                      thumbColor: violet100,
                                      inactiveColor: violet20,
                                      activeColor: violet100,
                                      divisions: 10,
                                      label: "${controller.sliderValue.value.round()} %",
                                      value: controller.sliderValue.value,
                                      onChanged: (value) {
                                        controller.sliderValue.value = value;
                                      },
                                    )
                                  : const SizedBox(),
                            ),
                          ),
                          CustomButton(
                            title: 'lbl_continue'.tr,
                            colorBg: violet100,
                            colorText: violet20,
                            colorRipple: dark75,
                            onPressed: () => showDialogSuccess('msg_transaction_has'.tr),
                            width: 400,
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
