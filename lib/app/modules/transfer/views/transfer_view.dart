import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/modules/transfer/widgets/transfer_widgets.dart';
import 'package:expense/app/theme/custom_bottom_dialog.dart';
import 'package:expense/app/theme/custom_button_style.dart';
import 'package:expense/app/theme/custom_text_filed.dart';
import 'package:expense/app/theme/dashed_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../controllers/transfer_controller.dart';

class TransferView extends GetView<TransferController> {
  const TransferView({Key? key}) : super(key: key);

  Future<bool> checkCameraPermission() async {
    PermissionStatus cameraPermissionStatus = await Permission.camera.request();
    return cameraPermissionStatus.isGranted;
  }

  void showCameraPermissionDeniedDialog() {
    Get.defaultDialog(
      title: 'Camera Permission Denied',
      content: const Text('You have denied camera permission. Please enable it in the app settings.'),
      confirm: ElevatedButton(
        child: const Text('OK'),
        onPressed: () {
          Get.back(); // Tutup dialog
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: violet100,
      appBar: AppBar(
        title: Text(
          'lbl_transfer'.tr,
          style: const TextStyle(
            fontFamily: 'Intel',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          child: Image.asset(
            'assets/icons/ic_arrow_left.png',
            color: Colors.white,
            scale: 3,
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
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      hintText: 'lbl_from'.tr,
                                      autofocus: false,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: CustomTextField(
                                      hintText: 'lbl_to'.tr,
                                      autofocus: false,
                                    ),
                                  ),
                                ],
                              ),
                              Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      30,
                                    ),
                                    color: light20,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset('assets/icons/ic_swap_horiz.svg'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            hintText: 'lbl_description'.tr,
                            autofocus: false,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.bottomSheet(
                                // The content of the bottom dialog
                                Container(
                                  // Add your desired content for the bottom dialog here
                                  height: 200,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20.0),
                                        child: Container(
                                          width: 50,
                                          height: 5,
                                          decoration: BoxDecoration(
                                            color: violet40,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: ItemBottomSheetDialog(
                                                title: 'lbl_camera'.tr,
                                                svgAsset: 'assets/icons/ic_camera.svg',
                                                onPressed: () async {
                                                  bool hasCameraPermission = await checkCameraPermission();

                                                  if (hasCameraPermission) {
                                                    XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);

                                                    if (image != null) {
                                                      print('Image path: ${image.path}');
                                                      controller.capturedImage.value = image;
                                                      Get.back();
                                                    } else {
                                                      print('Image capture canceled or failed.');
                                                    }
                                                  } else {
                                                    showCameraPermissionDeniedDialog();
                                                  }
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: ItemBottomSheetDialog(
                                                title: 'lbl_image'.tr,
                                                svgAsset: 'assets/icons/ic_gallery.svg',
                                                onPressed: () async {
                                                  final picker = ImagePicker();
                                                  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

                                                  if (pickedFile != null) {
                                                    print('Image path: ${pickedFile.path}');
                                                    controller.capturedImage.value = pickedFile;
                                                    Get.back();
                                                  } else {
                                                    // Tidak ada gambar yang dipilih.
                                                  }
                                                }, // jika diklik membuka gallery
                                              ),
                                            ),
                                            Expanded(
                                              child: ItemBottomSheetDialog(
                                                title: 'lbl_document'.tr,
                                                svgAsset: 'assets/icons/ic_file.svg',
                                                onPressed: () async {
                                                  final picker = ImagePicker();
                                                  final pickedFile = await picker.pickMedia();

                                                  if (pickedFile != null) {
                                                    print('Image path: ${pickedFile.path}');
                                                    controller.capturedImage.value = pickedFile;
                                                    Get.back();
                                                  } else {
                                                    // Tidak ada gambar yang dipilih.
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Set the shape of the bottom sheet
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              );
                            },
                            child: Obx(
                              () => controller.capturedImage.value != null ? ImageSelected(controller: controller) : const DashedBorderBox(),
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
