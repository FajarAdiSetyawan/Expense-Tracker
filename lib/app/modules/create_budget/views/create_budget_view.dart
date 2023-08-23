import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_budget_controller.dart';

class CreateBudgetView extends GetView<CreateBudgetController> {
  const CreateBudgetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CreateBudgetView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CreateBudgetView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
