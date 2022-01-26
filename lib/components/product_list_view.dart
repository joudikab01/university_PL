import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/models.dart';
import 'components.dart';
import '../providers/providers.dart';
import 'package:provider/provider.dart';

class ProductListView extends StatelessWidget {
  final List<Product> products;
  const ProductListView({required this.products, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
          child: ProductCard(
            productModel: products[index],
          ),
          onTap: () {
            Provider.of<ProductsManager>(context, listen: false)
                .selectProduct(index);
            Navigator.pushNamed(context, '/details');
          },
        );
      },
    );
  }
}
