import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uni_project/screens/add_product.dart';
import '../models/models.dart';
import '../components/components.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  /*List<Category> categories = [
    Category(name: 'cate1'),
    Category(name: 'cate2'),
    Category(name: 'cate3'),
    Category(name: 'cate4'),
    Category(name: 'cate5'),
    Category(name: 'cate1'),
    Category(name: 'cate2'),
    Category(name: 'cate3'),
    Category(name: 'cate4'),
    Category(name: 'cate5'),
    Category(name: 'cate1'),
    Category(name: 'cate2'),
    Category(name: 'cate3'),
    Category(name: 'cate4'),
    Category(name: 'cate5'),
  ];
  final List<Product> products = [
    Product(
      name: 'pro1',
      image: 'assets/pro1.jpg',
      expireDate: DateTime.now(),
      category: Category(name: 'cate1'),
      ownerId: 1,
      contactNumber: 1,
      quantity: 7,
      price: Price(
        firstSale: 23,
        secondSale: 3,
        thirdSale: 5,
        price: 4,
      ),
      facebookUrl: 'www',
    ),
    Product(
      name: 'pro2',
      image: 'assets/pro2.jpg',
      expireDate: DateTime.now(),
      category: Category(name: 'cate1'),
      ownerId: 1,
      contactNumber: 1,
      quantity: 1,
      price: Price(
        firstSale: 23,
        secondSale: 3,
        thirdSale: 5,
        price: 4,
      ),
      facebookUrl: 'www',
    ),
    Product(
      name: 'pro3',
      image: 'assets/pro3.jpg',
      expireDate: DateTime.now(),
      category: Category(name: 'cate1'),
      ownerId: 1,
      contactNumber: 1,
      quantity: 1,
      price: Price(
        firstSale: 23,
        secondSale: 3,
        thirdSale: 5,
        price: 4,
      ),
      facebookUrl: 'www',
    ),
    Product(
      name: 'pro4',
      image: 'assets/pro4.jpg',
      expireDate: DateTime.now(),
      category: Category(name: 'cate1'),
      ownerId: 1,
      contactNumber: 1,
      quantity: 1,
      price: Price(
        firstSale: 23,
        secondSale: 3,
        thirdSale: 5,
        price: 4,
      ),
      facebookUrl: 'www',
    ),
    Product(
      name: 'pro1',
      image: 'assets/pro1.jpg',
      expireDate: DateTime.now(),
      category: Category(name: 'cate1'),
      ownerId: 1,
      contactNumber: 1,
      quantity: 1,
      price: Price(
        firstSale: 23,
        secondSale: 3,
        thirdSale: 5,
        price: 4,
      ),
      facebookUrl: 'www',
    ),
    Product(
      name: 'pro2',
      image: 'assets/pro2.jpg',
      expireDate: DateTime.now(),
      category: Category(name: 'cate1'),
      ownerId: 1,
      contactNumber: 1,
      quantity: 1,
      price: Price(
        firstSale: 23,
        secondSale: 3,
        thirdSale: 5,
        price: 4,
      ),
      facebookUrl: 'www',
    ),
    Product(
      name: 'pro3',
      image: 'assets/pro3.jpg',
      expireDate: DateTime.now(),
      category: Category(name: 'cate1'),
      ownerId: 1,
      contactNumber: 1,
      quantity: 1,
      price: Price(
        firstSale: 23,
        secondSale: 3,
        thirdSale: 5,
        price: 4,
      ),
      facebookUrl: 'www',
    ),
    Product(
      name: 'pro4',
      image: 'assets/pro4.jpg',
      expireDate: DateTime.now(),
      category: Category(name: 'cate1'),
      ownerId: 1,
      contactNumber: 1,
      quantity: 1,
      price: Price(
        firstSale: 23,
        secondSale: 3,
        thirdSale: 5,
        price: 4,
      ),
      facebookUrl: 'www',
    ),
    Product(
      name: 'pro1',
      image: 'assets/pro1.jpg',
      expireDate: DateTime.now(),
      category: Category(name: 'cate1'),
      ownerId: 1,
      contactNumber: 1,
      quantity: 1,
      price: Price(
        firstSale: 23,
        secondSale: 3,
        thirdSale: 5,
        price: 4,
      ),
      facebookUrl: 'www',
    ),
    Product(
      name: 'pro2',
      image: 'assets/pro2.jpg',
      expireDate: DateTime.now(),
      category: Category(name: 'cate1'),
      ownerId: 1,
      contactNumber: 1,
      quantity: 1,
      price: Price(
        firstSale: 23,
        secondSale: 3,
        thirdSale: 5,
        price: 4,
      ),
      facebookUrl: 'www',
    ),
    Product(
      name: 'pro3',
      image: 'assets/pro3.jpg',
      expireDate: DateTime.now(),
      category: Category(name: 'cate1'),
      ownerId: 1,
      contactNumber: 1,
      quantity: 1,
      price: Price(
        firstSale: 23,
        secondSale: 3,
        thirdSale: 5,
        price: 4,
      ),
      facebookUrl: 'www',
    ),
    Product(
      name: 'pro4',
      image: 'assets/pro4.jpg',
      expireDate: DateTime.now(),
      category: Category(name: 'cate1'),
      ownerId: 1,
      contactNumber: 1,
      quantity: 1,
      price: Price(
        firstSale: 23,
        secondSale: 3,
        thirdSale: 5,
        price: 4,
      ),
      facebookUrl: 'www',
    ),
  ];*/
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    var q = min(height, width);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddProduct(
                    onCreate: (item) {
                      Navigator.pop(context);
                    },
                    onUpdate: (item) {}),
              ),
            );
          },
          backgroundColor: Colors.redAccent[200],
        ),
        body: Column(
          ///TODO:edit
          children: [
            CategoryListView(categories: []),
            Expanded(child: ProductListView(products: []),),
          ],
        ),
      ),
    );
  }
}
