import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/categories_models/data_categories.dart';
import '../models/models.dart';
import '../providers/providers.dart';
import '../components/components.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsManager>(builder: (context, manager, child) {
      return FutureBuilder(
          future: Provider.of<ProductsManager>(context, listen: false)
              .getAllCategories(),
          builder:
              (BuildContext context, AsyncSnapshot<DataCategories> snapshot) {
            DataCategories? dataCategories = snapshot.data ??
                DataCategories(categories: [
                  Categories(
                      name: '',
                      id: 0,
                      imageUrl: '',
                      products: [],
                      createdAt: '',
                      updatedAt: '')
                ]);
            bool isEng = manager.getLocal();
            List<Categories> categories = dataCategories.categories;
            List<Products> products =
                dataCategories.categories[manager.selectedCategory].products;
            if (!manager.isSelected) {
              return Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.blueGrey,
                  title: Text(
                    isEng ? 'Categories' : 'الأصناف',
                    style:
                        isEng ? GoogleFonts.openSans() : GoogleFonts.tajawal(),
                  ),
                  centerTitle: true,
                ),
                body: _buildCategories(categories),
              );
            } else {
              return Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.blueGrey,
                  title: Text(
                    isEng ? 'Categories' : 'الأصناف',
                    style:
                        isEng ? GoogleFonts.openSans() : GoogleFonts.tajawal(),
                  ),
                  centerTitle: true,
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                    onPressed: () {
                      Provider.of<ProductsManager>(context, listen: false)
                          .back();
                    },
                  ),
                ),
                body: RefreshIndicator(
                    onRefresh: () {
                      return Future.delayed(const Duration(milliseconds: 100),
                          () {
                            Provider.of<ProductsManager>(context).refresh();
                      });
                    },
                    child: _buildSortedProducts(categories, products)),
              );
            }
          });
    });
  }
}

Widget _buildCategories(List<Categories> categories) {
  return CategoriesListView(
    categories: categories,
  );
}

Widget _buildSortedProducts(
    List<Categories> categories, List<Products> products) {
  return Column(
    children: [
      MiniCategoryListView(
        categories: categories,
      ),
      const SizedBox(
        height: 12,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SortedProductListView(
          products: products,
        ),
      ),
    ],
  );
}
