import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/categories_models/data_categories.dart';
import '../models/models.dart';
import '../providers/providers.dart';
import '../components/components.dart';

class SortedProduct extends StatefulWidget {
  const SortedProduct({Key? key}) : super(key: key);

  @override
  State<SortedProduct> createState() => _SortedProductState();
}

class _SortedProductState extends State<SortedProduct> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:  Provider.of<ProductsManager>(context, listen: false).getAllCategories2(),
        builder: (BuildContext context, AsyncSnapshot<DataCategories> snapshot) {
          return Consumer<ProductsManager>(
            builder: (context, manager, child) {
              int index = Provider.of<ProductsManager>(context).selectedCategory;
              return Scaffold(
                body: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    MiniCategoryListView(categories: snapshot.data!.categories),
                    const SizedBox(
                      height: 12,
                    ),
                    SortedProductListView(
                      products: snapshot.data!.categories[index].products,
                    ),
                  ],
                ),
              );
            },
          );
        }
    );
  }
}
