import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.title,
    required this.colorBg,
    required this.colorText,
    required this.colorRipple,
    required this.onPressed,
    this.height = 50,
    this.width = 300,
  });

  String title = "";
  Color colorBg;
  Color colorText;
  Color colorRipple;
  final double width;
  final double height;

  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: colorRipple,
          backgroundColor: colorBg,
          animationDuration: const Duration(milliseconds: 1000),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: colorText,
            fontFamily: "Inter",
          ),
        ),
      ),
    );
  }
}

class CustomButtonIcon extends StatelessWidget {
  CustomButtonIcon({
    Key? key,
    required this.title,
    required this.colorBg,
    required this.colorText,
    required this.colorRipple,
    required this.onPressed,
    this.icon,
    this.svgPicture,
    this.height = 50,
    this.width = 300,
  }) : super(key: key);

  String title = "";
  Color colorBg;
  Color colorText;
  Color colorRipple;
  final double width;
  final double height;
  final Icon? icon;
  final SvgPicture? svgPicture;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    if (icon != null && svgPicture == null) {
      // If the icon is provided, use it.
      return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton.icon(
          icon: icon!,
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: colorRipple,
            backgroundColor: colorBg,
            animationDuration: const Duration(milliseconds: 1000),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          label: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: colorText,
              fontFamily: "Inter",
            ),
          ),
        ),
      );
    } else if (icon == null && svgPicture != null) {
      // If the SVG picture is provided, use it.
      return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: colorRipple,
            backgroundColor: colorBg,
            animationDuration: const Duration(milliseconds: 1000),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              svgPicture!,
              const SizedBox(width: 10), // Adjust the spacing between the icon and text
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: colorText,
                  fontFamily: "Inter",
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      throw ArgumentError('Either icon or svgPicture must be provided.');
    }
  }
}
