import 'dart:io';

import 'package:expense/app/modules/transfer/controllers/transfer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageSelected extends StatelessWidget {
  const ImageSelected({
    super.key,
    required this.controller,
  });

  final TransferController controller;

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
