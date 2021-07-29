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
    // final routeArgs = ModalRoute.of(context);
    // if (routeArgs == null) return SizedBox.shrink();
    // final popular = routeArgs.settings.arguments as String;
    final popular = ModalRoute.of(context)!.settings.arguments as String;
    final productsProvider = Provider.of<Products>(context);
    List<Product> productsList = productsProvider.products;
    if (popular == 'popular') {
      productsList = productsProvider.popularProducts;
    } else {
      productsList = productsProvider.products;
    }

    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 240 / 420,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
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
      // body: StaggeredGridView.countBuilder(
      //   crossAxisCount: 6,
      //   itemCount: 9,
      //   itemBuilder: (BuildContext context, int index) => FeedsProducts(),
      //   staggeredTileBuilder: (int index) =>
      //       new StaggeredTile.count(3, index.isEven ? 4.8 : 6),
      //   mainAxisSpacing: 3.0,
      //   crossAxisSpacing: 3.0,
      // ), //ASİMETRİK GRIDVIEW
    );
  }
}
