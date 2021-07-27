import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intern_app/widget/feeds_products.dart';

class FeedsScreen extends StatelessWidget {
  static const routeName = '/FeedsScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 6,
        itemCount: 9,
        itemBuilder: (BuildContext context, int index) => FeedsProducts(),
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(3, index.isEven ? 4.8 : 6),
        mainAxisSpacing: 3.0,
        crossAxisSpacing: 3.0,
      ),

      // body: GridView.count(
      //   crossAxisCount: 2,
      //   childAspectRatio: 3 / 4,
      //   children: List.generate(
      //     100,
      //     (index) {
      //       return FeedsProducts();
      //     },
      //   ),
      // ), // SİMETRİK DÜZGÜN GRID VIEW
    );
  }
}
