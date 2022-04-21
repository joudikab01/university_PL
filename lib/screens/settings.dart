import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../providers/products_manager.dart';

String dropDownValueE = 'EN';
String dropDownValueA = 'العربية';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

showAlertDialog(BuildContext context, bool eng) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text(
      eng ? "Cancel" : 'إلغاء',
      style: GoogleFonts.actor(
        color: Colors.blueGrey,
      ),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: Text(
      eng ? "Continue" : 'استمرار',
      style: GoogleFonts.actor(
        color: Colors.blueGrey,
      ),
    ),
    onPressed: () {
      try {
        String token =
            Provider.of<ProductsManager>(context, listen: false).getToken();
        var box = Boxes.getAuthBox();
        box.clear();
        Provider.of<ProductsManager>(context, listen: false)
            .logOut('Bearer $token');
        Navigator.popAndPushNamed(context, '/splash_screen');
      } catch (e) {}
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(eng ? "Confirm log out" : 'تأكيد تسجيل الخروج'),
    content: Text(eng
        ? "Are you sure you want to sign out?"
        : 'هل أنت متأكد أنك تريد تسجيل الخروج؟'),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    //var height = size.height;
    //var width = size.width;
    //var q = min(height, width);
    return Consumer<ProductsManager>(builder: (context, manager, child) {
      bool isEng = manager.getLocal();
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.blueGrey,
            title: Text(
              isEng ? 'Settings' : 'الإعدادات',
            ),
            centerTitle: true,
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: Svg('assets/settings.svg'),
              ),
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Directionality(
                      textDirection:
                          isEng ? TextDirection.ltr : TextDirection.rtl,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isEng ? 'App language' : 'لغة التطبيق',
                            style: const TextStyle(
                                color: Colors.black87, fontSize: 25),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          DropdownButton<String>(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            value: isEng ? dropDownValueE : dropDownValueA,
                            icon: const FaIcon(FontAwesomeIcons.angleDown),
                            onChanged: (String? value) {
                              setState(() {
                                if (value == 'EN' || value == 'الإنكليزية') {
                                  dropDownValueA = 'الإنكليزية';
                                  dropDownValueE = 'EN';
                                  isEng = true;
                                } else if (value == 'AR' ||
                                    value == 'الإنكليزية') {
                                  dropDownValueA = 'العربية';
                                  dropDownValueE = 'AR';
                                  isEng = false;
                                }
                              });
                              Provider.of<ProductsManager>(context,
                                      listen: false)
                                  .changeLocal(value!);
                            },
                            iconSize: 30,
                            style: const TextStyle(
                                color: Colors.black87, fontSize: 25),
                            elevation: 2,
                            items: isEng
                                ? <String>['EN', 'AR']
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList()
                                : <String>['الإنكليزية', 'العربية']
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 20),
                  //   child: Container(
                  //     width: width / 2.5,
                  //     height: height / 8,
                  //     decoration: BoxDecoration(
                  //       shape: BoxShape.rectangle,
                  //       borderRadius: BorderRadius.circular(20),
                  //     ),
                  //     child: Center(
                  //       child: DropdownButton<String>(
                  //         borderRadius: const BorderRadius.all(Radius.circular(16)),
                  //         value: dropDownValue,
                  //         icon: const FaIcon(FontAwesomeIcons.angleDown),
                  //         onChanged: (String? value) {
                  //           setState(() {
                  //             dropDownValue = value!;
                  //           });
                  //         },
                  //         iconSize: 30,
                  //         style: const TextStyle(
                  //             color: Colors.black87, fontSize: 25),
                  //         elevation: 2,
                  //         items: <String>['EN', 'AR']
                  //             .map<DropdownMenuItem<String>>((String value) {
                  //           return DropdownMenuItem<String>(
                  //             value: value,
                  //             child: Text(value),
                  //           );
                  //         }).toList(),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  TextButton(
                    onPressed: () {
                      showAlertDialog(context, isEng);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text(
                        isEng ? 'Change Account' : 'تغيير الحساب',
                        style: TextStyle(
                            fontSize: 20, color: Colors.blueGrey[300]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
