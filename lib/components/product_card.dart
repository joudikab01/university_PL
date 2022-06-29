import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({required this.product, Key? key}) : super(key: key);

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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: width / 2,
              maxHeight: height / 5.3,
            ),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft:Radius.circular(16),topRight:Radius.circular(16) ),
                image: DecorationImage(
                  image: NetworkImage(
                    product.image,
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(height: 10,),
          Text(
            product.name,
            style: GoogleFonts.adamina(
                fontSize: q / 35, fontWeight: FontWeight.w100),
          ),
          Text(
            '${product.price}',
            style: GoogleFonts.adamina(
                fontSize: q / 35, fontWeight: FontWeight.w100),
          ),
        ],
      ),
    );
  }
}
