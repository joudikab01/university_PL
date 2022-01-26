import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/models.dart';

class ProductCard extends StatelessWidget {
  final Product productModel;
  const ProductCard({required this.productModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    var q = min(height, width);
    return Card(
      elevation: 3,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: width / 3,
              maxHeight: height / 5,
            ),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                image: DecorationImage(
                  image: AssetImage(
                    productModel.image,
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          Text(
            productModel.name,
            style: GoogleFonts.adamina(
                fontSize: q / 29, fontWeight: FontWeight.w100),
          ),
          Text(
            ///TODO:edit
            '${productModel.price}',
            style: GoogleFonts.adamina(
                fontSize: q / 29, fontWeight: FontWeight.w100),
          ),
        ],
      ),
    );
  }
}
