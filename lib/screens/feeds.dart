import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intern_app/models/product.dart';
import 'package:intern_app/widget/feeds_products.dart';

class FeedsScreen extends StatelessWidget {
  List<Product> _products = [
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
      false,
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
      false,
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
      false,
      45,
    ),
  ];
  static const routeName = '/FeedsScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: StaggeredGridView.countBuilder(
      //   crossAxisCount: 6,
      //   itemCount: 9,
      //   itemBuilder: (BuildContext context, int index) => FeedsProducts(),
      //   staggeredTileBuilder: (int index) =>
      //       new StaggeredTile.count(3, index.isEven ? 4.8 : 6),
      //   mainAxisSpacing: 3.0,
      //   crossAxisSpacing: 3.0,
      // ), //ASİMETRİK GRIDVIEW
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 240 / 420,
        children: List.generate(
          _products.length,
          (index) {
            return FeedsProducts(
              id: _products[index].id,
              title: _products[index].title,
              desc: _products[index].desc,
              price: _products[index].price,
              imageUrl: _products[index].imageUrl,
              quantity: _products[index].quantity,
              isFavorite: _products[index].isFavorite,
            );
          },
        ),
      ), // SİMETRİK DÜZGÜN GRID VIEW
    );
  }
}
