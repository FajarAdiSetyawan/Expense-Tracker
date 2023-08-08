import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:expense/app/core/constants/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    this.controller,
    this.autofocus = true,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.validator,
    this.enableSuggestions = false,
    this.autocorrect = true,
    this.isPassword = false, // Add this boolean flag to check if it's a password field
  }) : super(key: key);

  final String hintText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final int? maxLines;
  final bool? autofocus;
  final bool? enableSuggestions;
  final bool? autocorrect;
  final bool isPassword;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    final obscureText = RxBool(isPassword); // Create a reactive variable

    return Obx(() {
      return TextFormField(
        controller: controller,
        autofocus: autofocus!,
        obscureText: obscureText.value, // Use the value from the RxBool
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        validator: validator,
        enableSuggestions: enableSuggestions!,
        autocorrect: autocorrect!,
        decoration: InputDecoration(
          hintText: hintText,
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
          suffixIcon: isPassword
              ? IconButton(
                  onPressed: () {
                    obscureText.toggle(); // Toggle the obscureText value using Getx method
                  },
                  icon: Icon(
                    obscureText.value ? Icons.visibility_outlined : Icons.visibility_off,
                    color: obscureText.value ? Colors.grey : Colors.blue,
                  ),
                )
              : null,
        ),
      );
    });
  }
}

class _CustomTextFieldState extends GetxController {
  RxBool obscureText = true.obs;
}



class DropDownTextFieldCustom extends StatelessWidget {
  const DropDownTextFieldCustom({
    super.key,
    required this.hintText,
    required this.dropDownValueModel,
  });

  final String hintText;
  final List<DropDownValueModel> dropDownValueModel;

  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
      textFieldDecoration: InputDecoration(
        hintText: hintText,
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
      dropDownIconProperty: IconProperty(icon: Icons.keyboard_arrow_down_rounded),
      dropDownList: dropDownValueModel,
    );
  }
}

class TextFiledBalance extends StatelessWidget {
  const TextFiledBalance({
   Key? key,
    required this.hintText,
    this.controller,
    this.autofocus = true,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.number,
    this.validator,
  }) : super(key: key);

  final String hintText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final bool? autofocus;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      controller: controller,
      autofocus: autofocus!,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white,
          fontSize: 50,
          fontWeight: FontWeight.bold,
          fontFamily: "Inter",
        ),
        border: InputBorder.none,
      ),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 50,
        fontWeight: FontWeight.bold,
        fontFamily: "Inter",
      ),
    );
  }
}