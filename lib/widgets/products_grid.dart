import 'package:flutter/material.dart';
import 'package:flutter_shop_app/providers/products.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop_app/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  const ProductsGrid(this.showFavs, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemCount: products.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        // create: (context) => products[index],
        value: products[index],
        child: const ProductItem(
            // products[index].id,
            // products[index].title,
            // products[index].imageUrl,
            ),
      ),
    );
  }
}
