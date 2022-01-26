import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/components.dart';
import '../models/models.dart';

class CategoryListView extends StatelessWidget {
  final List<Category> categories;
  const CategoryListView({required this.categories, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    var q = min(height, width);
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
        // gradient: LinearGradient(
        //   colors: [
        //     Color.fromARGB(255, 229, 215, 236),
        //     Color.fromARGB(255, 220, 196, 232),
        //     Color.fromARGB(255, 210, 170, 228),
        //     Color.fromARGB(255, 200, 146, 226),
        //     Color.fromARGB(255, 189, 122, 220),
        //     Color.fromARGB(255, 178, 108, 212),
        //     Color.fromARGB(255, 167, 93, 201),
        //     Color.fromARGB(255, 153, 76, 190),
        //     Color.fromARGB(255, 139, 58, 177),
        //     Color.fromARGB(255, 126, 48, 163),
        //     Color.fromARGB(255, 126, 48, 163),
        //     Color.fromARGB(255, 139, 58, 177),
        //     Color.fromARGB(255, 153, 76, 190),
        //     Color.fromARGB(255, 167, 93, 201),
        //     Color.fromARGB(255, 178, 108, 212),
        //     Color.fromARGB(255, 189, 122, 220),
        //     Color.fromARGB(255, 200, 146, 226),
        //     Color.fromARGB(255, 210, 170, 228),
        //     Color.fromARGB(255, 220, 196, 232),
        //     Color.fromARGB(255, 229, 215, 236),
        //   ],
        // ),
      ),
      child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) {
            return TextButton(
              // style: ButtonStyle(
              //   elevation: MaterialStateProperty.all(1),
              //   backgroundColor:
              //       MaterialStateProperty.all(Colors.deepPurple[400]),
              //   shape: MaterialStateProperty.all(
              //     CircleBorder(
              //       side: BorderSide(width: width / 4),
              //     ),
              //   ),
              // ),
              onPressed: () {},
              child: Text(
                categories[index].name,
                style: GoogleFonts.aBeeZee(
                    color: Colors.white, fontSize: q / 24),
              ),
            );
          }),
    );
  }
}
