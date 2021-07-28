import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  Product(
      this.id,
      this.title,
      this.desc,
      this.price,
      this.imageUrl,
      this.productCategoryName,
      this.brand,
      this.isFavorite,
      this.isPopular,
      this.quantity);

  final String id;
  final String title;
  final String desc;
  final double price;
  final String imageUrl;
  final String productCategoryName;
  final String brand;
  final int quantity;
  final bool isFavorite;
  final bool isPopular;
}
