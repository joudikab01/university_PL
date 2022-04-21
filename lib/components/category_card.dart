import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/products_manager.dart';
import '../models/models.dart';

class CategoryCard extends StatelessWidget {
  final Categories category;
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Consumer<ProductsManager>(
      builder: (context, dataManger, child) {
        return Stack(children: [
          Container(
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.all(8.0),
            constraints: BoxConstraints.expand(
              height: height / 4,
              width: width - 16,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(category.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
          ),
          Container(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                category.name,
                style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontSize: width / 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.all(8.0),
            constraints: BoxConstraints.expand(
              height: height / 4,
              width: width - 16,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.black.withOpacity(0.7),
                  Colors.transparent
                ],
                begin: Alignment.bottomRight,
              ),
              //color: Colors.black.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            ),
          ),
        ]);
      },
    );
  }
}


