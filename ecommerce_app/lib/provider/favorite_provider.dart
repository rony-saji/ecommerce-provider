import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favoriteprovider extends ChangeNotifier {
  final List<Product> _favorite = [];
  List<Product> get favorites => _favorite;
  void tooglefavorite(Product product) {
    if (_favorite.contains(product)) {
      _favorite.remove(product);
    } else {
      _favorite.add(product);
    }
    notifyListeners();
  }

  bool isExist(Product product) {
    final isExist = _favorite.contains(product);
    return isExist;
  }

  static Favoriteprovider of(BuildContext context, {bool listen = true}) {
    return Provider.of<Favoriteprovider>(
      context,
      listen: listen,
    );
  }
}
