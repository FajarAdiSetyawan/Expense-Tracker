import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class IncomeController extends GetxController {

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Rx<XFile?> capturedImage = Rx<XFile?>(null);

  void deleteCapturedImage() {
    if (capturedImage.value != null) {
      // Delete the captured image here
      capturedImage.value = null;
    }
  }

  RxBool repeatSwitch = false.obs;

  var selectedFrequency = 'Option 1'.obs;
  var selectedMonth = RxInt(1);
  var selectedDate = RxInt(1);

  void updateSelectedFrequency(String value) {
    selectedFrequency.value = value;
  }

  void updateSelectedMonth(int month) {
    selectedMonth.value = month;
  }

  void updateSelectedDate(int date) {
    selectedDate.value = date;
  }

  final List<String> monthNames = [
    'Jan',
    'Feb',
    'Mar',
    'April',
    'Mei',
    'June',
    'July',
    'Augst',
    'Sept',
    'Okt',
    'Nov',
    'Dec',
  ];

  final List<String> dropdownOptions = [
    'Yearly',
    'Monthly',
    'Daily',
  ];

  final List<int> yearOptions = List<int>.generate(100, (index) => DateTime.now().year - index);
  final List<int> monthOptions = List<int>.generate(12, (index) => index + 1);

  var selectedDateEnd = DateTime.now().obs;

  String selectDateFormat() {
    final format = DateFormat('dd MMM yyyy');
    return format.format(selectedDateEnd.value);
  }

  Future<DateTime?> showDatePick(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
  }
}
