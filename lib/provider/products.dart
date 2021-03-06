import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:intern_app/models/product.dart';

class Products with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products {
    return _products;
  }

  Future<void> FetchProducts() async {
    await FirebaseFirestore.instance
        .collection('products')
        .get()
        .then((QuerySnapshot productsSnapshot) {
      _products = [];
      productsSnapshot.docs.forEach((element) {
        _products.insert(
          0,
          Product(
            element.get('productId'),
            element.get('productTitle'),
            element.get('productDescription'),
            double.parse(element.get('price')),
            element.get('productImage'),
            element.get('productCategory'),
            element.get('productBrand'),
            false,
            true,
            int.parse(element.get('productQuantity')),
          ),
        );
      });
    });
  }

  List<Product> get popularProducts {
    return _products.where((element) => element.isPopular).toList();
  }

  Product findById(String productId) {
    return _products.firstWhere((element) => element.id == productId);
  }
  /* List<Product> _products = [
    Product(
      'pr1',
      'Premium Üyelik',
      'Özel ayrıcalıklı aylık üyelik.',
      850,
      'https://media.istockphoto.com/photos/premium-membership-gold-badge-picture-id530649463?k=6&m=530649463&s=170667a&w=0&h=CgsOLtH70dsBvDMBr8ZEPzBQ1qRP0VyrOcyADIKu6oo=',
      'Abonelikler',
      'Abonelik',
      false,
      false,
      999,
    ),
    Product(
      'pr2',
      'LABISTS 3D Yazıcı',
      '3 Boyutlu hızlı ve kaliteli baskı cihazı',
      9600,
      'https://cdn.shopify.com/s/files/1/0261/8074/7357/products/1_b9435f7d-b5eb-4993-8076-4c882694d815_1500x.jpg?v=1581062150',
      'Yazıcılar',
      'LABISTS',
      false,
      true,
      12,
    ),
    Product(
      'pr3',
      'Playstation 5',
      'Yeni nesil oyun konsolu.',
      7800,
      'https://atlas-content-cdn.pixelsquid.com/assets_v2/245/2452423176773178782/jpeg-600/G03.jpg?modifiedAt=1',
      'Oyun Konsolları',
      'Sony',
      false,
      true,
      5,
    ),
    Product(
      'pr4',
      'Gold Üyelik',
      'Gold ayrıcalıklı aylık üyelik.',
      500,
      'https://wwwi.globalpiyasa.com/lib/Urun/670/bfdf3549f5ecdc4fb868dcbe75873656.jpg',
      'Abonelikler',
      'Abonelik',
      false,
      false,
      999,
    ),
    Product(
      'pr5',
      'Silver Üyelik',
      'Silver ayrıcalıklı aylık üyelik.',
      250,
      'https://wwwi.globalpiyasa.com/lib/Urun/670/25c91b269169f3159e5e2056b87f6530_1.jpg',
      'Abonelikler',
      'Abonelik',
      false,
      false,
      999,
    ),
    Product(
      'pr6',
      'Bronz Üyelik',
      'Bronz ayrıcalıklı aylık üyelik.',
      100,
      'https://static.wixstatic.com/media/6ab01d_363d7db5a3394168ba9cac1a6a53f0d1.png/v1/fit/w_500,h_500,q_90/file.png',
      'Abonelikler',
      'Abonelik',
      false,
      false,
      999,
    ),
    Product(
      'pr7',
      'Airpods Pro',
      'Elegant ve son teknoloji bluetooth kulaklık.',
      2239,
      'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MWP22?wid=1144&hei=1144&fmt=jpeg&qlt=80&.v=1591634795000',
      'Kulaklıklar',
      'Apple',
      false,
      true,
      45,
    ),
  ];*/
}
