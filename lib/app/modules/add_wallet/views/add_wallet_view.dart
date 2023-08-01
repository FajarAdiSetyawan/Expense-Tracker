import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_wallet_controller.dart';

class AddWalletView extends GetView<AddWalletController> {
  const AddWalletView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddWalletView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddWalletView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
