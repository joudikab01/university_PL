import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uni_project/screens/add_product.dart';
import '../components/components.dart';
import '../models/models.dart';

class DetailsCard extends StatefulWidget {
  final Product product;
  const DetailsCard({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailsCard> createState() => _DetailsCardState();
}

bool _isFavorited = false;

class _DetailsCardState extends State<DetailsCard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    var q = min(height, width);
    return ListView(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  widget.product.image,
                ),
                fit: BoxFit.cover,
              )),
              constraints: BoxConstraints.expand(
                height: height / 2.5,
                width: width / 1.2,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    radius: 20,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _isFavorited = !_isFavorited;
                        });
                      },
                      icon: Icon(
                        _isFavorited ? Icons.favorite : Icons.favorite_border,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Text(
                    '2031',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    radius: 20,
                    child: const Icon(
                      FontAwesomeIcons.eye,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    '341',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    radius: 20,
                    child: IconButton(
                      onPressed: () {
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
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                  gradient: LinearGradient(
                      colors: <Color>[Colors.deepOrangeAccent, Colors.amber]),
                ),
                constraints: const BoxConstraints.expand(
                  width: 80,
                  height: 24,
                ),
                child: Center(
                  child: Text(
                    ///edit
                    widget.product.categoryId.toString(),
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
                  gradient: LinearGradient(
                      colors: <Color>[Colors.red, Colors.redAccent]),
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.product.name,
            style: GoogleFonts.archivoBlack(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          ///edit
          child: Text('${widget.product.price} SP',
            style: GoogleFonts.archivoBlack(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                ///edit
                'Expires at ${widget.product.expireDate}',
                style: GoogleFonts.archivoBlack(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                ///edit
                ' ${widget.product.expireDate}',
                style: GoogleFonts.archivoBlack(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                ///edit
                ' ${widget.product.expireDate}',
                style: GoogleFonts.archivoBlack(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),

        Text(
          ' Owner contact info: ',
          style: GoogleFonts.archivoBlack(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            border: TableBorder.symmetric(
              inside: const BorderSide(color: Colors.blueGrey),
              outside: const BorderSide(color: Colors.blueGrey),
            ),
            children: [
              TableRow(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'Owner phone number',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      ' ${widget.product.contactNumber.toString()}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'Facebook url',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      '${widget.product.facebookUrl} ',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
