import 'package:flutter/material.dart';
import '../screens/details.dart';
import '../models/models.dart';
import 'components.dart';
import '../providers/providers.dart';
import 'package:provider/provider.dart';

class SortedProductListView extends StatelessWidget {
  final List<Products> products;
  const SortedProductListView({required this.products, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: products.length,
        scrollDirection: Axis.vertical,
        primary: true,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            child: SortedProductCard(
              product: products[index],
            ),
            onTap: () async {
              Provider.of<ProductsManager>(context, listen: false)
                  .selectProduct(index);
              ProductDetails product = await Provider.of<ProductsManager>(context,listen: false).getProductDetails(products[index].id);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(product: product)));
            },
          );
        },
      ),
    );
  }
}
