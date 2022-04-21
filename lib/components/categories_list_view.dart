import 'package:flutter/material.dart';
import '../components/components.dart';
import '../models/models.dart';
import '../providers/providers.dart';
import 'package:provider/provider.dart';

class CategoriesListView extends StatelessWidget {
  final List<Categories> categories;
  const CategoriesListView({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 8,
        right: 8,
      ),
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              Provider.of<ProductsManager>(context,listen: false).changeCategory(index);
            },
            child: CategoryCard(category: category),
          );
        },
      ),
    );
  }
}
