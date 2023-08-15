import 'package:expense/app/core/constants/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}