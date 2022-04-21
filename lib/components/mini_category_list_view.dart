import 'dart:math';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/products_manager.dart';
import '../components/components.dart';
import '../models/models.dart';

class MiniCategoryListView extends StatelessWidget {
  final List<Categories> categories;
  const MiniCategoryListView({required this.categories, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    double q = min(height, width);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      width: width,
      height: height / 14,
      decoration: const BoxDecoration(
        color: Colors.blueGrey,
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(1, 1),
            color: Colors.grey,
            blurRadius: 10,
            spreadRadius: 5,
          )
        ],
      ),
      child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) {
            Color color = Provider.of<ProductsManager>(context,listen: false).cardColor(index);
            return TextButton(
              onPressed: () {
                Provider.of<ProductsManager>(context, listen: false)
                    .changeCategory(index);
              },
              child: Text(
                categories[index].name,
                style: GoogleFonts.aBeeZee(
                    color: color, fontSize: q / 24),
              ),
            );
          }),
    );
  }
}
