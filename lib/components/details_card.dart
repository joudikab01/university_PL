import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../components/components.dart';
import '../providers/providers.dart';
import '../screens/screens.dart';
import '../models/models.dart';

class DetailsCard extends StatefulWidget {
  final ProductDetails product;
  const DetailsCard({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailsCard> createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  final commentController = TextEditingController();
  final FocusNode commentFocusNode = FocusNode();

  @override
  void dispose() {
    commentFocusNode.dispose();
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool onSale =
        _onSale(widget.product.price, widget.product.newPrice.toInt());
    double discount = calculateDiscount(
        widget.product.price, widget.product.newPrice.toInt());
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    bool _isFavorited = Provider.of<ProductsManager>(context, listen: false)
        .getLike(widget.product.id);
    var q = min(height, width);
    return Consumer<ProductsManager>(builder: (context, manager, child) {
      return Expanded(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(
                  widget.product.image,
                ),
                fit: BoxFit.cover,
              )),
              constraints: BoxConstraints.expand(
                height: height / 2.5,
                width: width,
              ),
            ),
            Positioned(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    radius: 20,
                    child: IconButton(
                      onPressed: () {
                        String token =
                            Provider.of<ProductsManager>(context, listen: false)
                                .getToken();
                        try {
                          !_isFavorited
                              ? Provider.of<ProductsManager>(context,
                                      listen: false)
                                  .addLike(
                                      'Bearer $token',
                                      FormData.fromMap(
                                          {'product_id': widget.product.id}))
                              : Provider.of<ProductsManager>(context,
                                      listen: false)
                                  .removeLike('Bearer $token',
                                      widget.product.id);
                          setState(() {
                            _isFavorited = !_isFavorited;
                            Provider.of<ProductsManager>(context, listen: false)
                                .setLike(widget.product.id, _isFavorited);
                          });
                          Provider.of<ProductsManager>(context).refresh();
                        } catch (e) {}
                      },
                      icon: Icon(
                        _isFavorited ? Icons.favorite : Icons.favorite_border,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    widget.product.likesCount.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    radius: 20,
                    child: const Icon(
                      FontAwesomeIcons.eye,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    widget.product.countViews.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    radius: 20,
                    child: IconButton(
                      onPressed: () {
                        var box = Boxes.getUserBox();
                        UserSign? userSign = box.get('userData');
                        int _id = userSign!.id;
                        if (widget.product.user.id == _id) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddProduct(
                                originalProduct: widget.product,
                                onUpdate: (item) {
                                  Navigator.pop(context);
                                },
                                onCreate: (item) {},
                              ),
                            ),
                          );
                        } else {}
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              right: 10,
              top: 25,
            ),
            Positioned(
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(30)),
                    color: Color.fromRGBO(255, 250, 250, 1),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 15,
                        offset: Offset(-5, 5),
                      )
                    ]),
                constraints: BoxConstraints.expand(
                  width: width,
                  height: height / 2 + 50,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, top: 16, bottom: 8),
                      child: Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                              gradient: LinearGradient(colors: <Color>[
                                Colors.deepOrangeAccent,
                                Colors.amber
                              ]),
                            ),
                            constraints: const BoxConstraints.expand(
                              width: 100,
                              height: 24,
                            ),
                            child: Center(
                              child: Text(
                                widget.product.category.name.toString(),
                                style: GoogleFonts.archivoBlack(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                              gradient: LinearGradient(colors: <Color>[
                                Colors.red,
                                Colors.redAccent
                              ]),
                            ),
                            constraints: const BoxConstraints.expand(
                              width: 200,
                              height: 24,
                            ),
                            child: Center(
                              child: Text(
                                'Only ${widget.product.quantity.toString()} left in stock',
                                style: GoogleFonts.archivoBlack(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              top: 8,
                              bottom: 4,
                            ),
                            child: Text(
                              widget.product.name,
                              style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, bottom: 4),
                            child: Row(
                              children: [
                                Text(
                                  'Expires at ${widget.product.expireDate}',
                                  style: GoogleFonts.openSans(
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '${widget.product.commentsCount}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text(
                                  'Comments',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  manager.view
                                      ? Icons.arrow_drop_up_rounded
                                      : Icons.arrow_drop_down_rounded,
                                  size: 25,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            onPressed: () {
                              manager.viewComments();
                            },
                          ),
                          manager.view
                              ? CommentsListView(
                                  comments: widget.product.comments)
                              : const SizedBox(),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: width - 65,
                                  child: TextFormField(
                                    controller: commentController,
                                    focusNode: commentFocusNode,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                            width: 2,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              width: 2, color: Colors.black26),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                            width: 2,
                                            color: Colors.blueGrey,
                                          ),
                                        ),
                                        hintText: 'Write your comment',
                                        fillColor: Colors.blueGrey),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.send_rounded,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                  onPressed: () async {
                                    String token = Provider.of<ProductsManager>(
                                            context,
                                            listen: false)
                                        .getToken();
                                    Map<String, dynamic> map = {
                                      'value': commentController.text,
                                      'product_id': widget.product.id
                                    };
                                    FormData formData = FormData.fromMap(map);
                                    commentController.text = '';
                                    await Provider.of<ProductsManager>(context,
                                            listen: false)
                                        .addComment('Bearer $token', formData);
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 126)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              top: 250,
              bottom: 0,
            ),
            Positioned(
              bottom: 0,
              child: FlipCard(
                speed: 1000,
                fill: Fill.fillBack,
                direction: FlipDirection.HORIZONTAL,
                front: Container(
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(30)),
                    color: Color.fromRGBO(240, 181, 168, 1),
                  ),
                  constraints: BoxConstraints.expand(
                    width: width,
                    height: 120,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${widget.product.newPrice} SP',
                              style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onSale
                                ? Text(
                                    '${widget.product.price} SP',
                                    style: GoogleFonts.openSans(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.black45,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                        Stack(
                          children: [
                            SizedBox(
                              height: 80,
                              width: width / 4 + 24,
                            ),
                            Positioned(
                              top: 20,
                              child: Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                    color: Color.fromRGBO(254, 245, 231, 1)),
                                width: width / 5 + 20,
                                height: height / 17,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${discount.toInt()}',
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                    Image.asset(
                                      'assets/%.png',
                                      height: 26,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onSale
                                ? const Positioned(
                                    right: 28,
                                    top: 35,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Color.fromRGBO(240, 181, 168, 1),
                                      radius: 5,
                                    ))
                                : const SizedBox(),
                            onSale
                                ? Positioned(
                                    child: Image.asset(
                                      'assets/sale.png',
                                      height: 45,
                                    ),
                                    right: 4,
                                    top: 36,
                                  )
                                : const SizedBox()
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                back: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(30)),
                        color: Color.fromRGBO(240, 181, 168, 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Product owner\'s info: ',
                              style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontSize: 23,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    const FaIcon(
                                      FontAwesomeIcons.whatsappSquare,
                                      size: 28,
                                    ),
                                    Text(
                                      ' ${widget.product.user.phoneNumber}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  children: [
                                    const FaIcon(
                                      FontAwesomeIcons.facebookSquare,
                                      size: 28,
                                    ),
                                    Text(
                                      ' ${widget.product.user.facebook} ',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        size: 50,
                        color: Colors.black,
                      ),
                      right: 10,
                      bottom: 25,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

double calculateDiscount(int price, int newPrice) {
  double discount = (price - newPrice) / price * 100;
  return discount;
}

bool _onSale(int price, int newPrice) {
  if (price == newPrice) {
    return false;
  } else {
    return true;
  }
}
