import 'package:flutter/cupertino.dart';
import 'package:intern_app/models/cart_attr.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartAttr> _cartItems = {};

  Map<String, CartAttr> get getCartItems {
    return _cartItems;
  }

  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void removeItemFromCart(
      String productId, double price, String title, String imageUrl) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (existingCartItem) => CartAttr(
          existingCartItem.id,
          existingCartItem.title,
          existingCartItem.quantity - 1,
          existingCartItem.price,
          existingCartItem.imageUrl,
        ),
      );
    }
    notifyListeners();
  }

  void addProductToCart(
      String productId, double price, String title, String imageUrl) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (existingCartItem) => CartAttr(
          existingCartItem.id,
          existingCartItem.title,
          existingCartItem.quantity + 1,
          existingCartItem.price,
          existingCartItem.imageUrl,
        ),
      );
    } else {
      _cartItems.putIfAbsent(
        productId,
        () => CartAttr(
          DateTime.now().toString(),
          title,
          1,
          price,
          imageUrl,
        ),
      );
    }
    notifyListeners();
  }

  void deleteProduct(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
