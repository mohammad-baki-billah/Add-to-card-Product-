import 'package:flutter/material.dart';

class CardModel extends ChangeNotifier {
  final List _shopItems = [
    ['Apple', '4.00', 'assets/images/apple.png', Colors.green],
    ['Banana', '2.00', 'assets/images/banana.png', Colors.yellow],
    ['Chicken', '6.00', "assets/images/fried-chicken.png", Colors.brown],
    ['Avocado', '3.00', 'assets/images/avocado.png', Colors.green],
  ];
  get shopItem => _shopItems;

  // list of cart items
  List _cartItems = [];
  get shopItems => _shopItems;
  get cartCount => _cartItems;

  void addItemTocart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
