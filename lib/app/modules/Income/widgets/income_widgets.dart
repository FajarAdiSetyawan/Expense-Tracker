import 'dart:io';

import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/modules/Income/controllers/income_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';



class DashedBorderBox extends StatelessWidget {
  const DashedBorderBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 75,
        decoration: BoxDecoration(
          border: DashedBorder.fromBorderSide(
            dashLength: 15,
            side: BorderSide(
              color: light20,
              width: 2,
            ),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Jika gambar sudah diambil dari kamera atau galeri
            SvgPicture.asset(
              'assets/icons/ic_attachment.svg',
              height: 30,
              width: 30,
            ),
            const SizedBox(width: 20),
            Text(
              'lbl_add_attachment'.tr,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
  }
}

class ImageSelected extends StatelessWidget {
  const ImageSelected({
    super.key,
    required this.controller,
  });

  final IncomeController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: FileImage(
                    File(controller.capturedImage.value!.path),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: -10,
            right: -10,
            child: IconButton(
              icon: SvgPicture.asset('assets/icons/ic_close.svg'),
              onPressed: () {
                // Add your logic here for when the close button is pressed
                // gambar dari capturedImage akan dihapus
                controller.deleteCapturedImage();
              },
            ),
          ),
        ],
      );
  }
}
