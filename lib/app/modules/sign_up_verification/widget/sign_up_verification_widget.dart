import 'package:expense/app/core/constants/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

final defaultPinTheme = PinTheme(
  width: 40,
  height: 40,
  textStyle: TextStyle(
    fontSize: 30,
    color: dark100,
    fontWeight: FontWeight.bold,
  ),
  decoration: BoxDecoration(
    color: light100,
    borderRadius: BorderRadius.circular(20),
  ),
);

final followingPinTheme = PinTheme(
  width: 40,
  height: 40,
  textStyle: TextStyle(
    fontSize: 30,
    color: dark100,
    fontWeight: FontWeight.bold,
  ),
  decoration: BoxDecoration(
    color: Colors.grey[300],
    borderRadius: BorderRadius.circular(20),
  ),
);

final errorPinTheme = PinTheme(
  width: 40,
  height: 40,
  textStyle: const TextStyle(
    fontSize: 30,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  ),
  decoration: BoxDecoration(
    color: red80,
    borderRadius: BorderRadius.circular(20),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: dark100, width: 0, style: BorderStyle.none),
  borderRadius: BorderRadius.circular(20),
  color: Colors.grey[300],
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration?.copyWith(
    color: Colors.white,
  ),
);
