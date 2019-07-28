import 'package:flutter/foundation.dart';

class CartItem {
  String id;
  String title;
  int quantity;
  double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {...items};
  }

  int get itemsCount {
    return _items.length; 
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (oldCartItem) => CartItem(
          id: oldCartItem.id,
          title: oldCartItem.title,
          price: oldCartItem.price,
          quantity: oldCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }
}
