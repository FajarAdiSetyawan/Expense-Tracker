import 'dart:io';

import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/modules/Income/controllers/income_controller.dart';
import 'package:expense/app/theme/custom_button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


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

class BottomDialogRepeat extends StatefulWidget {
  final IncomeController controller;

  BottomDialogRepeat({required this.controller});

  @override
  _BottomDialogRepeatState createState() => _BottomDialogRepeatState();
}

class _BottomDialogRepeatState extends State<BottomDialogRepeat> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return SingleChildScrollView(
          child: Container(
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
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'lbl_frequency'.tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                    left: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        fit: FlexFit.tight, // Ensure the dropdown takes available space
                        // Adjust as needed
                        child: DropdownButtonFormField<String>(
                          items: widget.controller.dropdownOptions.map(
                            (item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              );
                            },
                          ).toList(),
                          onChanged: (selectedItem) {
                            widget.controller.updateSelectedFrequency(selectedItem!);
                          },
                          decoration: InputDecoration(
                            hintText: 'lbl_year'.tr,
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
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        fit: FlexFit.tight, // Ensure the dropdown takes available space
                        child: DropdownButtonFormField<int>(
                          items: widget.controller.monthOptions.map(
                            (month) {
                              return DropdownMenuItem<int>(
                                value: month,
                                child: Text(widget.controller.monthNames[month - 1]),
                              );
                            },
                          ).toList(),
                          onChanged: (selectedMonth) {
                            widget.controller.updateSelectedMonth(selectedMonth!);
                          },
                          decoration: InputDecoration(
                            hintText: 'month',
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
                        ),
                      ),
                      const SizedBox(width: 5),
                      Flexible(
                        fit: FlexFit.tight, // Ensure the dropdown takes available space
                        child: Obx(
                          () {
                            final selectedMonth = widget.controller.selectedMonth.value;
                            final daysInMonth = DateTime(DateTime.now().year, selectedMonth + 1, 0).day;
                            final dateOptions = List<int>.generate(daysInMonth, (index) => index + 1);

                            return DropdownButtonFormField<int>(
                              items: dateOptions.map(
                                (date) {
                                  return DropdownMenuItem<int>(
                                    value: date,
                                    child: Text(date.toString()),
                                  );
                                },
                              ).toList(),
                              onChanged: (selectedDate) {
                                widget.controller.updateSelectedDate(selectedDate!);
                              },
                              decoration: InputDecoration(
                                hintText: 'day',
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
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'lbl_end_after'.tr,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'lbl_date'.tr,
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () async {
                          final pickedDate = await widget.controller.showDatePick(context);
                          if (pickedDate != null) {
                            setState(() {
                              selectedDate = pickedDate;
                              widget.controller.selectedDateEnd.value = pickedDate;
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              DateFormat('dd MMM yyyy').format(selectedDate),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                CustomButton(
                  title: 'lbl_next'.tr,
                  colorBg: violet100,
                  colorText: violet20,
                  colorRipple: violet20,
                  width: 350,
                  onPressed: () {},
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

