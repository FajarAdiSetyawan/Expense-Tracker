import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/bank_model.dart';
import '../../../data/wallet_model.dart';

class AddWalletController extends GetxController {
  final Rx<Color> _borderColor = Colors.transparent.obs;

  Color get borderColor => _borderColor.value;

  void setBorderColor(Color color) {
    _borderColor.value = color;
  }

  var selectedImgAsset = RxString('Bank');

  void setSelectedImgAsset(String? imgAsset) {
    selectedImgAsset.value = imgAsset ?? "";
  }

  RxString selectedValue = RxString('Bank');

  void onDropdownChanged(dynamic value) {
    selectedValue.value = value;
  }

  List<Map<String, dynamic>> getSelectedItems() {
    final selectedDropdownValue = selectedValue.value;
    final selectedItem = nestedMap.firstWhere(
      (item) => item["name"] == selectedDropdownValue,
      orElse: () => {"data": []},
    );

    return selectedItem["data"] ?? [];
  }

  List<Bank> banks = [
    Bank(id: 1, name: "Bank A", img: "assets/images/ic_bca.png"),
    Bank(id: 2, name: "Bank B", img: "assets/images/ic_bni.png"),
    Bank(id: 2, name: "Bank B", img: "assets/images/ic_mandiri.png"),
    Bank(id: 4, name: "Bank C", img: "assets/images/ic_bri.jpg"),
    Bank(id: 5, name: "Bank C", img: "assets/images/ic_bsi.png"),
    Bank(id: 6, name: "Bank C", img: "assets/images/ic_jago.png"),
    Bank(id: 7, name: "Bank C", img: "assets/images/ic_paypal.png"),
    Bank(id: 8, name: "Bank C", img: "assets/images/ic_see_other.png"),
  ];

  List<Wallet> wallets = [
    Wallet(id: 101, name: "Wallet X", balance: 0, img: "assets/images/ic_gopay.png"),
    Wallet(id: 102, name: "Wallet Y", balance: 0, img: "assets/images/ic_ovo.png"),
    Wallet(id: 103, name: "Wallet Z", balance: 0, img: "assets/images/ic_dana.jpg"),
    Wallet(id: 104, name: "Wallet Z", balance: 0, img: "assets/images/ic_shopeepay.png"),
    Wallet(id: 105, name: "Wallet Z", balance: 0, img: "assets/images/ic_linkaja.png"),
    Wallet(id: 106, name: "Wallet Z", balance: 0, img: "assets/images/ic_doku.jpg"),
  ];

  List<Map<String, dynamic>> nestedMap = [];

  @override
  void onInit() {
    super.onInit();
    // Initialize combinedMap here in the onInit method
    generateNestedMap();
  }

  void generateNestedMap() {
    nestedMap = [
      {
        "id": 1,
        "name": "Bank",
        "data": banks
            .map(
              (bank) => {
                "id": bank.id,
                "name": bank.name,
                "img": bank.img,
              },
            )
            .toList()
      },
      {
        "id": 2,
        "name": "E Wallet",
        "data": wallets
            .map(
              (wallet) => {
                "id": wallet.id,
                "name": wallet.name,
                "img": wallet.img,
              },
            )
            .toList()
      },
    ];
  }
}
