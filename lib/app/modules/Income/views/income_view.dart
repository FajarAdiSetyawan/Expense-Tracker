import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/income_controller.dart';

class IncomeView extends GetView<IncomeController> {
  const IncomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IncomeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'IncomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
