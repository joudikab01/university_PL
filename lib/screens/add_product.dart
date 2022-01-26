import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/models.dart';
import 'package:intl/intl.dart';


class AddProduct extends StatefulWidget {
  final Function(Product) onCreate;
  final Function(Product) onUpdate;
  final Product? originalProduct;
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

class _AddProductState extends State<AddProduct> {
  final _nameController = TextEditingController();
  String _name = '';
  final _priceController = TextEditingController();
  String _price = '';
  DateTime _date = DateTime.now();
  int _quantity = 0;

  @override
  void initState() {
    final originalProduct = widget.originalProduct;
    if (originalProduct != null) {
      _nameController.text = originalProduct.name;
      _name = originalProduct.name;
      _quantity = originalProduct.quantity;
      ///TODO:edit
      _price = originalProduct.price.toString();
    }
    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
    _priceController.addListener(() {
      setState(() {
        _price = _nameController.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(6.0),
        child: ListView(
          children: [
            buildTextField('Product Name','Enter Product Name',_nameController),
            buildTextField('Price','Enter price',_priceController),
            buildQuantityField(),
            buildDateField(context),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label,String hintText,TextEditingController controller) {
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
          decoration:  InputDecoration(
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
              'Date',
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
        Text('${DateFormat('yyyy-MM-dd').format(_date)}'),
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
              _quantity.toInt().toString(),
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

}

