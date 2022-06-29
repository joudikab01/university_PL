import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../providers/products_manager.dart';
import '../components/components.dart';
import 'dart:ui' as ui;

String dropDownValue = 'Name';
String dropDownValueAr = 'الاسم';

DateTime dateTime = DateTime.now();

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchTextController;

  @override
  void initState() {
    searchTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  bool searchByName = true;
  bool searchFromDate = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Consumer<ProductsManager>(builder: (context, manager, child) {
      DataHome dataHome = manager.searchData ?? DataHome(products: []);
      bool isEng = manager.getLocal();
      return SafeArea(
        child: Directionality(
          textDirection: isEng?ui.TextDirection.ltr: ui.TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.blueGrey,
              title: Text(
                isEng ? 'Search By' : 'بحث عبر',
                style: isEng ? GoogleFonts.openSans() : GoogleFonts.tajawal(),
              ),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: DropdownButton<String>(
                    dropdownColor: Colors.blueGrey,
                    icon: const FaIcon(
                      FontAwesomeIcons.angleDown,
                      color: Colors.white,
                    ),
                    elevation: 0,
                    borderRadius:
                        const BorderRadius.only(bottomLeft: Radius.circular(16)),
                    value: isEng? dropDownValue: dropDownValueAr,
                    items: isEng?<String>['Name', 'From Date', 'To Date']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList():<String>['الاسم', 'من تاريخ', 'الا تاريخ']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(
                        () {
                          if (value == 'Name' || value == 'الاسم') {
                            searchByName = true;
                            searchFromDate = false;
                            dropDownValue = 'Name';
                            dropDownValueAr = 'الاسم';
                          } else if (value == 'From Date' || value =='من تاريخ') {
                            searchByName = false;
                            searchFromDate = true;
                            dropDownValue = 'From Date';
                            dropDownValueAr = 'من تاريخ';
                          } else {
                            searchByName = false;
                            searchFromDate = false;
                            dropDownValueAr = 'الا تاريخ';
                            dropDownValue = 'To Date';
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            body: ListView(
              //primary: false,
              //shrinkWrap: true,
              children: [
                _buildSearchCard(isEng, searchByName, searchFromDate),
                dataHome.products.isNotEmpty
                    ? ProductListView(
                        products: dataHome.products,
                        isSearch: true,
                      )
                    : Center(
                        child: Image.asset(
                          'assets/search.png',
                          height: height / 2,
                          width: width,
                        ),
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Future<void> startSearchName(String value) async {
    String key =
        Provider.of<ProductsManager>(context, listen: false).searchKey('Name');
    Map<String, dynamic> map = {key: value};
    FormData formData = FormData.fromMap(map);
    Provider.of<ProductsManager>(context, listen: false)
        .search(formData, value);
    //print(data.products);
  }

  void startSearchDate(DateTime value, bool isFrom) async {
    late String key;
    if (isFrom) {
      key = Provider.of<ProductsManager>(context, listen: false)
          .searchKey('From Date');
    } else {
      key = Provider.of<ProductsManager>(context, listen: false)
          .searchKey('To Date');
    }
    String validValue = '${value.year}-${value.month}-${value.day}';
    Map<String, dynamic> map = {key: validValue};
    FormData formData = FormData.fromMap(map);
    Provider.of<ProductsManager>(context, listen: false).search(formData, '.');
  }

  Widget _buildSearchCard(bool eng, bool searchByName, bool searchFromDate) {
    return Card(
      elevation: 4,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: searchByName
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: eng ? 'Search' : 'بحث'),
                      autofocus: false,
                      textInputAction: TextInputAction.done,
                      controller: searchTextController,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      if (searchByName) {
                        startSearchName(searchTextController.text);
                      }
                      final currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    },
                  ),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        searchFromDate ? 'From Date' : 'To Date',
                        style: GoogleFonts.lato(fontSize: 22.0),
                      ),
                      Text(
                        DateFormat('yyyy-MM-dd').format(dateTime),
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    child: const Text(
                      'Select',
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () async {
                      final currentDate = DateTime.now();
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: currentDate,
                        firstDate: currentDate,
                        lastDate: DateTime(currentDate.year + 5),
                      );
                      setState(() {
                        dateTime = selectedDate!;
                      });
                      startSearchDate(selectedDate!, searchFromDate);
                    },
                  ),
                ],
              ),
      ),
    );
  }


}
