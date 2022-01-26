import 'package:flutter/material.dart';
import '../models/models.dart';
import '../providers/providers.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  final List<Product> products;
  const DetailsScreen({Key? key, required this.products}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    int i =
        Provider.of<ProductsManager>(context, listen: false).selectedProduct;
    final controller = PageController(initialPage: i);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.products[i].name),
        centerTitle: true,
        leading: IconButton(
          icon: const FaIcon(
            FontAwesomeIcons.chevronCircleLeft,
            size: 28,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PageView.builder(
                onPageChanged: (value) {
                  Provider.of<ProductsManager>(context, listen: false)
                      .selectProduct(value);
                },
                itemCount: widget.products.length,
                scrollDirection: Axis.horizontal,
                controller: controller,
                itemBuilder: (context, index) {
                  return DetailsCard(product: widget.products[index]);
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  i = Provider.of<ProductsManager>(context, listen: false)
                      .selectedProduct;
                  controller.animateToPage(i - 1,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeIn);
                },
                child: Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.angleDoubleLeft,
                      size: 28,
                    ),
                    Text(
                      'Previous',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  i = Provider.of<ProductsManager>(context, listen: false)
                      .selectedProduct;
                  controller.animateToPage(i + 1,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeIn);
                },
                child: Row(
                  children: const [
                    Text(
                      'Next',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    FaIcon(
                      FontAwesomeIcons.angleDoubleRight,
                      size: 28,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
