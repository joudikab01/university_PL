import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/cache_manager.dart';
import '../screens/add_product.dart';
import '../models/models.dart';
import '../components/components.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../providers/providers.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<bool> sort = [false, false, false, false];
  List<bool> desc = [false, false, false, false];
  double sortHeight = 0;
  bool sorting = false;
  Map<String, dynamic> map = {'order_by': ''};
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    double q = min(height, width);

    return Consumer<ProductsManager>(builder: (context, manager, child) {
      return FutureBuilder(
          future: sort.contains(true)
              ? manager.sort(FormData.fromMap(map))
              : manager.getAllData(),
          builder: (BuildContext context, AsyncSnapshot<DataHome> snapshot) {
            DataHome data = snapshot.data ??
                DataHome(products: [
                ]);
            // if (snapshot.connectionState == ConnectionState.done) {
            bool isEng = manager.getLocal();
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.blueGrey,
                title: Text(
                  isEng ? 'Products' : 'المنتجات',
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          sorting ? sortHeight = 0 : sortHeight = 40;
                          sorting = !sorting;
                        });
                      },
                      icon: const Icon(FontAwesomeIcons.sortAmountDownAlt))
                ],
              ),
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
                        onUpdate: (item) {},
                      ),
                    ),
                  );
                },
                backgroundColor: const Color.fromRGBO(240, 181, 168, 1),
              ),
              body: RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(const Duration(milliseconds: 100), () {
                    Provider.of<ProductsManager>(context, listen: false)
                        .refresh();
                  });
                },
                child: Column(
                  children: [
                    sortListView(width, height, q),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ProductListView(
                          products: data.products,
                          isSearch: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
            // }
            // else {
            //   bool isEng = manager.getLocal();
            //   return Scaffold(
            //       appBar: AppBar(
            //         elevation: 0,
            //         backgroundColor: Colors.blueGrey,
            //         title: Text(
            //           isEng ? 'Products' : 'المنتجات',
            //         ),
            //         centerTitle: true,
            //       ),
            //       floatingActionButton: FloatingActionButton(
            //         child: const Icon(
            //           Icons.add,
            //         ),
            //         onPressed: () {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (context) => AddProduct(
            //                 onCreate: (item) {
            //                   Navigator.pop(context);
            //                 },
            //                 onUpdate: (item) {},
            //               ),
            //             ),
            //           );
            //         },
            //         backgroundColor: const Color.fromRGBO(240, 181, 168, 1),
            //       ),
            //       body: const Center(child: CircularProgressIndicator()));
            // }
          });
    });
  }

  Widget sortButton(String sortBy, Function() onPressed, double q, int index) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Text(
            sortBy,
            style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: q / 20),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 600),
            opacity: sort[index] ? 1 : 0,
            child: Icon(
              desc[index]
                  ? FontAwesomeIcons.angleUp
                  : FontAwesomeIcons.angleDown,
              color: sort[index] ? Colors.white : Colors.transparent,
              size: 26,
            ),
          ),
        ],
      ),
    );
  }

  Widget sortListView(double width, double height, double q) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      width: width,
      height: sortHeight,
      color: Colors.blueGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          sortButton(
            'Price',
            () {
              setState(() {
                map['order_by'] = 'price';
                if (sort[0] == false) {
                  for (int i = 0; i < 4; i += 1) {
                    sort[i] = false;
                  }
                  for (int i = 0; i < 4; i += 1) {
                    desc[i] = false;
                  }
                  sort[0] = true;
                  desc[0] = false;
                } else {
                  if (desc[0] == false) {
                    map['DESC'] = 'true';
                    desc[0] = true;
                  } else {
                    map.clear();
                    desc[0] = false;
                    sort[0] = false;
                  }
                }
              });
            },
            q,
            0,
          ),
          sortButton('Views', () {
            setState(() {
              map['order_by'] = 'count_views';
              if (sort[1] == false) {
                for (int i = 0; i < 4; i += 1) {
                  sort[i] = false;
                }
                for (int i = 0; i < 4; i += 1) {
                  desc[i] = false;
                }
                sort[1] = true;
                desc[1] = false;
              } else {
                if (desc[1] == false) {
                  map['DESC'] = 'true';
                  desc[1] = true;
                } else {
                  map.clear();
                  desc[1] = false;
                  sort[1] = false;
                }
              }
            });
          }, q, 1),
          sortButton('Name', () {
            setState(() {
              map['order_by'] = 'name';
              if (sort[2] == false) {
                for (int i = 0; i < 4; i += 1) {
                  sort[i] = false;
                }
                for (int i = 0; i < 4; i += 1) {
                  desc[i] = false;
                }
                sort[2] = true;
                desc[2] = false;
              } else {
                if (desc[2] == false) {
                  map['DESC'] = 'true';
                  desc[2] = true;
                } else {
                  map.clear();
                  desc[2] = false;
                  sort[2] = false;
                }
              }
            });
          }, q, 2),
          sortButton('Quant', () {
            setState(() {
              map['order_by'] = 'quantity';
              if (sort[3] == false) {
                for (int i = 0; i < 4; i += 1) {
                  sort[i] = false;
                }
                for (int i = 0; i < 4; i += 1) {
                  desc[i] = false;
                }
                sort[3] = true;
                desc[3] = false;
              } else {
                if (desc[3] == false) {
                  map['DESC'] = 'true';
                  desc[3] = true;
                } else {
                  map.clear();
                  desc[3] = false;
                  sort[3] = false;
                }
              }
            });
          }, q, 3),
        ],
      ),
    );
  }
}
