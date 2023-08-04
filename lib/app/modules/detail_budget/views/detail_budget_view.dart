import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_budget_controller.dart';

class DetailBudgetView extends GetView<DetailBudgetController> {
  const DetailBudgetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailBudgetView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailBudgetView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
