import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

String dropDownValue = 'EN';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Continue"),
    onPressed: () {
      Navigator.popAndPushNamed(context, '/splash_screen');
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Confirm log out"),
    content: const Text("Are you sure you want to sign out?"),
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
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    var q = min(height, width);
    return SafeArea(
      child: Scaffold(
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
                  padding: EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'App language',
                        style: TextStyle(color: Colors.black87, fontSize: 25),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      DropdownButton<String>(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        value: dropDownValue,
                        icon: const FaIcon(FontAwesomeIcons.angleDown),
                        onChanged: (String? value) {
                          setState(() {
                            dropDownValue = value!;
                          });
                        },
                        iconSize: 30,
                        style: const TextStyle(
                            color: Colors.black87, fontSize: 25),
                        elevation: 2,
                        items: <String>['EN', 'AR']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
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
                    showAlertDialog(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Text(
                      'Change Account',
                      style:
                          TextStyle(fontSize: 20, color: Colors.blueGrey[300]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
