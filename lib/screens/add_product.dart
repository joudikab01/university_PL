import 'dart:math';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:dio/dio.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/providers.dart';
import '../models/models.dart';
import 'package:intl/intl.dart';

class AddProduct extends StatefulWidget {
  final Function(AddProduct) onCreate;
  final Function(AddProduct) onUpdate;
  final ProductDetails? originalProduct;
  final bool isUpdating;

  const AddProduct({
    Key? key,
    required this.onCreate,
    required this.onUpdate,
    this.originalProduct,
  })  : isUpdating = (originalProduct != null),
        super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

enum category { makeup, skinCare, cleaning, food }

class _AddProductState extends State<AddProduct> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _imageController = TextEditingController();
  DateTime _date = DateTime.now();
  String _name = '';
  String _price = '';
  String _image = '';
  int _quantity = 0;
  int _count = 0;
  int _categoryId = 0;
  int _id = 0;
  category _category = category.makeup;
  List<Discount> finalDiscounts = [];

  Map<String, dynamic> setProduct() {
    Map<String, dynamic> editProduct = {
      'name': _name,
      'price': _price,
      '_method': 'put',
      'quantity': _quantity,
      'image_url': _imageController.text,
      'category_id': _categoryId
    };
    return editProduct;
  }

  @override
  void initState() {
    final originalProduct = widget.originalProduct;
    if (originalProduct != null) {
      _nameController.text = originalProduct.name;
      _name = originalProduct.name;
      _priceController.text = '${originalProduct.price}';
      _price = '${originalProduct.price}';
      _quantity = originalProduct.quantity;
      _id = originalProduct.id;
      _imageController.text = originalProduct.image;
      _image = originalProduct.image;
      _categoryId = originalProduct.categoryId;
    }
    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
    _priceController.addListener(() {
      setState(() {
        _price = _priceController.text;
      });
    });
    _imageController.addListener(() {
      setState(() {
        _image = _imageController.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    var q = min(height, width);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            onPressed: () {
              String token =
                  Provider.of<ProductsManager>(context, listen: false)
                      .getToken();
              AddProductModel addProduct = AddProductModel(
                price: int.parse(_price),
                quantity: _quantity,
                name: _name,
                image: _image,
                categoryId: _categoryId,
                discounts: finalDiscounts,
                expireDate: DateFormat('yyyy-MM-dd').format(_date),
              );
              try {
                widget.isUpdating
                    ? Provider.of<ProductsManager>(context, listen: false)
                        .editProduct('Bearer $token', _id,
                            FormData.fromMap(setProduct()))
                    : Provider.of<ProductsManager>(context, listen: false)
                        .addProduct('Bearer $token', addProduct.toJson());
                Navigator.pop(context);
              } catch (e) {}
            },
            icon: const Icon(
              FontAwesomeIcons.check,
              size: 25,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(6.0),
        child: ListView(
          children: [
            buildTextField(
                'Product Name', 'Enter Product Name', _nameController),
            buildTextField('Price', 'Enter price', _priceController),
            imageCard(width, height, q),
            chooseCategory(),
            buildQuantityField(),
            widget.isUpdating ? const SizedBox() : buildDateField(context),
            buildCounter(),
            buildDiscountBar(_count),
            const Divider(
              thickness: 1,
              height: 10,
              color: Colors.grey,
            ),
            widget.isUpdating
                ? TextButton(
                    onPressed: () async {
                      String token =
                          Provider.of<ProductsManager>(context, listen: false)
                              .getToken();
                      try {
                        await Provider.of<ProductsManager>(context,
                                listen: false)
                            .deleteProduct('Bearer $token', _id);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      } catch (e) {}
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.delete_forever_rounded,
                          color: Colors.red,
                        ),
                        Text(
                          'Delete this product',
                          style: GoogleFonts.aclonica(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
      String label, String hintText, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.lato(fontSize: 28),
        ),
        TextField(
          controller: controller,
          cursorColor: Colors.blueGrey,
          decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey),
            ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDateField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Expire Date',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            TextButton(
              child: const Text('Select'),
              onPressed: () async {
                final currentDate = DateTime.now();
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: currentDate,
                  lastDate: DateTime(currentDate.year + 5),
                );
                setState(() {
                  if (selectedDate != null) {
                    _date = selectedDate;
                  }
                });
              },
            ),
          ],
        ),
        Text(DateFormat('yyyy-MM-dd').format(_date)),
      ],
    );
  }

  Widget buildQuantityField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              'Quantity',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            const SizedBox(width: 16.0),
            Text(
              _quantity.toString(),
              style: GoogleFonts.lato(fontSize: 18.0),
            ),
          ],
        ),
        Slider(
          inactiveColor: Colors.blueGrey.withOpacity(0.5),
          activeColor: Colors.blueGrey,
          value: _quantity.toDouble(),
          min: 0.0,
          max: 100.0,
          divisions: 100,
          label: _quantity.toInt().toString(),
          onChanged: (double value) {
            setState(
              () {
                _quantity = value.toInt();
              },
            );
          },
        ),
      ],
    );
  }

  Widget buildDiscountBar(int? count) {
    return ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: count,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        'Discount ${index + 1}',
                        style: GoogleFonts.lato(fontSize: 24.0),
                      ),
                      const SizedBox(width: 16.0),
                      Text(
                        '${finalDiscounts[index].dv}%',
                        style: GoogleFonts.lato(fontSize: 18.0),
                      ),
                    ],
                  ),
                  discountDate(context, index),
                ],
              ),
              Slider(
                inactiveColor: Colors.blueGrey.withOpacity(0.5),
                activeColor: Colors.blueGrey,
                value: finalDiscounts[index].dv.toDouble(),
                min: 0.0,
                max: 100.0,
                divisions: 20,
                label: finalDiscounts[index].dv.toString(),
                onChanged: (double value) {
                  setState(
                    () {
                      finalDiscounts[index].dv = value.toInt();
                    },
                  );
                },
              ),
            ],
          );
        });
  }

  Widget buildCounter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            AnimatedFlipCounter(
              value: _count,
              duration: const Duration(milliseconds: 400),
              textStyle: GoogleFonts.lato(fontSize: 28.0),
              curve: Curves.easeInQuint,
            ),
            const SizedBox(width: 2.0),
            Text(
              'Discounts',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    if (_count == 0) {
                    } else {
                      _count -= 1;
                      finalDiscounts.removeAt(_count);
                    }
                  });
                },
                icon: const Icon(
                  Icons.remove,
                  size: 32,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    _count += 1;
                    Discount discount = Discount(
                        date:
                            '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}',
                        dv: 0);
                    finalDiscounts.add(discount);
                  });
                },
                icon: const Icon(
                  Icons.add,
                  size: 32,
                )),
          ],
        ),
      ],
    );
  }

  Widget discountDate(BuildContext context, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          child: const Text('Date'),
          onPressed: () async {
            final currentDate = DateTime.now();
            final selectedDate = await showDatePicker(
              context: context,
              initialDate: currentDate,
              firstDate: currentDate,
              lastDate: DateTime(currentDate.year + 5),
            );
            setState(() {
              if (selectedDate != null) {
                finalDiscounts[index].date =
                    '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}';
              }
            });
          },
        ),
        Text(finalDiscounts[index].date),
      ],
    );
  }

  Widget imageCard(double width, double height, double q) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton(
          child: Text(
            'Image',
            style: GoogleFonts.lato(fontSize: 28, color: Colors.black),
          ),
          onPressed: () {
            cardKey.currentState!.toggleCard();
          },
        ),
        FlipCard(
          speed: 800,
          key: cardKey,
          fill: Fill.fillFront,
          direction: FlipDirection.VERTICAL,
          flipOnTouch: false,
          front: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 6,
              ),
              Expanded(
                child: Card(
                  elevation: 2,
                  child: SizedBox(
                    height: height / 3,
                    child: TextField(
                      maxLines: 20,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: ' Enter image URL',
                        contentPadding: EdgeInsets.only(left: 10, top: 4),
                      ),
                      autofocus: false,
                      textInputAction: TextInputAction.done,
                      controller: _imageController,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.drive_folder_upload),
                onPressed: () {
                  Future.delayed(const Duration(seconds: 1), () {
                    cardKey.currentState!.toggleCard();
                  });
                  final currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
              ),
            ],
          ),
          back: Card(
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
                    maxWidth: width,
                    maxHeight: height / 3,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    image: DecorationImage(
                      image: NetworkImage(_imageController.text),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  _nameController.text,
                  style: GoogleFonts.adamina(
                      fontSize: q / 26, fontWeight: FontWeight.w100),
                ),
                Text(
                  _priceController.text,
                  style: GoogleFonts.adamina(
                      fontSize: q / 28, fontWeight: FontWeight.w100),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget chooseCategory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        Wrap(
          spacing: 10.0,
          children: [
            ChoiceChip(
              label: Text(
                'makeup',
                style: TextStyle(
                    color: _categoryId == 2 ? Colors.white : Colors.black),
              ),
              selected: _categoryId == 2,
              selectedColor: Colors.black,
              onSelected: (selected) {
                setState(() {
                  _category = category.makeup;
                  _categoryId = 2;
                });
              },
            ),
            ChoiceChip(
              selectedColor: Colors.black,
              selected: _categoryId == 5,
              label: Text(
                'Skin Care',
                style: TextStyle(
                    color: _categoryId == 5 ? Colors.white : Colors.black),
              ),
              onSelected: (selected) {
                setState(() {
                  _category = category.skinCare;
                  _categoryId = 5;
                });
              },
            ),
            ChoiceChip(
              selectedColor: Colors.black,
              selected: _categoryId == 6,
              label: Text(
                'Cleaning',
                style: TextStyle(
                    color: _categoryId == 6 ? Colors.white : Colors.black),
              ),
              onSelected: (selected) {
                setState(() {
                  _category = category.cleaning;
                  _categoryId = 6;
                });
              },
            ),
            ChoiceChip(
              selectedColor: Colors.black,
              selected: _categoryId == 7,
              label: Text(
                'Food',
                style: TextStyle(
                    color: _categoryId == 7 ? Colors.white : Colors.black),
              ),
              onSelected: (selected) {
                setState(() {
                  _category = category.food;
                  _categoryId = 7;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
