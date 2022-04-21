import 'package:flutter/material.dart';
import '../models/models.dart';

class SearchCard extends StatelessWidget {
  final Product product;
  const SearchCard({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
      },
      contentPadding: const EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(product.name,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),),
          Text(product.expireDate,
              style: const TextStyle(fontSize: 20, color: Colors.red)),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          product.image,
          height: 50.0,
        ),
      ),
      trailing: Text('${product.price}'),
    );
  }
}
