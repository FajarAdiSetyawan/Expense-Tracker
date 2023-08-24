class Wallet {
  final int id;
  final String name;
  final String img;
  final double balance;

  Wallet({required this.id, required this.name, required this.img, required this.balance});
}

List<Wallet> walletList = [
  Wallet(id: 1, name: 'Wallet', balance: 300,img: 'assets/icons/ic_wallet.svg'),
  Wallet(id: 2, name: 'Chase', balance: 3000,img: 'assets/icons/ic_chase.svg'),
  Wallet(id: 3, name: 'City', balance: 1000,img: 'assets/icons/ic_city_bank.svg'),
  Wallet(id: 4, name: 'Paypal', balance: 5000,img: 'assets/icons/ic_paypal.svg'),
];
