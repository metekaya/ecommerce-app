import 'package:flutter/material.dart';
import 'package:intern_app/models/product.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intern_app/provider/products.dart';
import 'package:intern_app/widget/feeds_products.dart';
import 'package:provider/provider.dart';

class FeedsScreen extends StatelessWidget {
  static const routeName = '/FeedsScreen';
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);
    List<Product> productsList = productsProvider.products;
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
          productsList.length,
          (index) {
            return ChangeNotifierProvider.value(
              value: productsList[index],
              child: FeedsProducts(),
            );
          },
        ),
      ), // SİMETRİK DÜZGÜN GRID VIEW
    );
  }
}
