import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/routes/app_pages.dart';
import 'package:expense/app/theme/custom_button_style.dart';
import 'package:expense/app/theme/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/add_wallet_controller.dart';

class AddWalletView extends GetView<AddWalletController> {
  const AddWalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: violet100,
      appBar: AppBar(
        title: Text(
          'lbl_add_new_wallet'.tr,
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
        surfaceTintColor: violet100,
        backgroundColor: violet100,
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
                          CustomTextField(
                            hintText: 'lbl_chase'.tr,
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
                              value: controller.selectedValue.value,
                              onChanged: controller.onDropdownChanged,
                              items: controller.nestedMap.map<DropdownMenuItem<String>>((item) {
                                return DropdownMenuItem<String>(
                                  value: item["name"].toString(),
                                  child: Text(item["name"].toString()),
                                );
                              }).toList(), // data controller.generateNestedMap [name]
                            );
                          }),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'lbl_bank'.tr,
                            style: TextStyle(
                              color: dark100,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(
                            () => SizedBox(
                              // berubah gambar jika memilih wallet / bank dari DropdownButtonFormField
                              height: 220,
                              child: GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4, // Reduce the number of items per row
                                  crossAxisSpacing: 8, // Reduce the horizontal spacing
                                  mainAxisSpacing: 8,
                                ),
                                itemCount: controller.getSelectedItems().length,
                                itemBuilder: (context, index) {
                                  final item = controller.getSelectedItems()[index];
                                  return ItemWallet(imgAssets: item["img"]);
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            title: 'lbl_continue'.tr,
                            colorBg: violet100,
                            colorText: violet20,
                            colorRipple: dark75,
                            onPressed: () => Get.toNamed(Routes.SIGN_UP_SUCCESS),
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

class ItemWallet extends StatelessWidget {
  ItemWallet({
    Key? key,
    required this.imgAssets,
  }) : super(key: key);

  final AddWalletController controller = Get.put(AddWalletController());
  final String imgAssets;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final isSelected = imgAssets == controller.selectedImgAsset.value;

        return GestureDetector(
          onTap: () => controller.setSelectedImgAsset(isSelected ? null : imgAssets),
          child: Material(
            type: MaterialType.card,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: isSelected ? violet100 : light10,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            color: light10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(imgAssets),
            ),
          ),
        );
      },
    );
  }
}
