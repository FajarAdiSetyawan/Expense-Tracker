import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/routes/app_pages.dart';
import 'package:expense/app/theme/custom_button_style.dart';
import 'package:expense/app/theme/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/add_account_controller.dart';

class AddAccountView extends GetView<AddAccountController> {
  AddAccountView({Key? key}) : super(key: key);

  List<String> options = [
    'Options 1',
    'Options 2',
    'Options 3',
    'Options 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? blueDark : violet100,
      appBar: AppBar(
        title: Text(
          'lbl_add_new_account'.tr,
        ),
        centerTitle: true,
        leading: GestureDetector(
          child: Transform.scale(
            scale: 0.7,
            child: SvgPicture.asset(
              'assets/icons/ic_arrows_left.svg',
              color: light100,
            ),
          ),
          onTap: () => Get.back(),
        ),
        surfaceTintColor: Get.isDarkMode ? blueDark : violet100,
        backgroundColor: Get.isDarkMode ? blueDark : violet100,
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
              child: TextFiledBalance(hintText: '\$ 0.00'),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Get.isDarkMode ? bgSecondaryDark : light100,
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
                          CustomTextField(
                            hintText: 'lbl_name'.tr,
                            autofocus: false,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(() {
                            return DropdownButtonFormField(
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontFamily: 'Intel',
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: violet80, width: 3.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: light20, width: 2.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: red40, width: 3.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: red40, width: 3.0),
                                ),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              icon: Icon(
                                Icons.expand_more_rounded,
                                color: Colors.grey[500],
                                size: 40,
                              ),
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w600,
                                fontFamily: "Inter",
                                fontSize: 16,
                              ),
                              value: controller.selectedOption.value,
                              onChanged: controller.updateSelectedOption,
                              items: options.map((option) {
                                return DropdownMenuItem(
                                  value: option, // Make sure each option has a unique value
                                  child: Text(option),
                                );
                              }).toList(),
                            );
                          }),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            title: 'lbl_continue'.tr,
                            colorBg: violet100,
                            colorText: violet20,
                            colorRipple: dark75,
                            onPressed: () => Get.toNamed(Routes.ADD_WALLET),
                            width: 400,
                          ),
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
