import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../providers/providers.dart';
import '../screens/screens.dart';

class UserProduct extends StatelessWidget {
  final Products product;
  const UserProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async{
        ProductDetails _product =
            await Provider.of<ProductsManager>(context, listen: false)
            .getProductDetails(product.id);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(product: _product)));
      },
      contentPadding: const EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            product.name,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            product.expireDate,
            style: const TextStyle(fontSize: 14, color: Colors.red),
          ),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          product.image,
          height: 50.0,
        ),
      ),
      trailing: Text(
        '${product.price} SP',
        style: GoogleFonts.openSans(
          fontWeight: FontWeight.w700,
          fontSize: 18
        ),
      ),
    );
  }
}
