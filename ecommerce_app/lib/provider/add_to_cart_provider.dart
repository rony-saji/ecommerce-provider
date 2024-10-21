import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class cartprovider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;
  void tooglefavorite(Product product) {
    if (_cart.contains(product)) {
      for (Product element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  incrementQtn(int index) {
    _cart[index].quantity++;
    notifyListeners();
  }

  decrementQtn(int index) {
    if (_cart[index].quantity <= 1) {
      return;
    }
    _cart[index].quantity--;
    notifyListeners();
  }

  totalprice() {
    double myTotal = 0.0;
    for (Product element in _cart) {
      myTotal += element.price * element.quantity;
    }
    return myTotal;
  }

  static cartprovider of(BuildContext context, {bool listen = true}) {
    return Provider.of<cartprovider>(context, listen: listen,);
  }
}
