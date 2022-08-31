import 'dart:io';
import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../models/models.dart';
import '../components/components.dart';
import 'package:ionicons/ionicons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';

class SecondSignUpScreen extends StatefulWidget {
  const SecondSignUpScreen({Key? key}) : super(key: key);

  @override
  _SecondSignUpScreenState createState() => _SecondSignUpScreenState();
}

class _SecondSignUpScreenState extends State<SecondSignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final facebookController = TextEditingController();
  late FocusNode nameFocusNode;
  late FocusNode phoneNumberFocusNode;
  late FocusNode facebookFocusNode;
  @override
  void initState() {
    nameFocusNode = FocusNode();
    phoneNumberFocusNode = FocusNode();
    facebookFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneNumberController.dispose();
    nameFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    facebookFocusNode.dispose();
    facebookController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    var q = min(height, width);
    return SafeArea(
      child: Consumer<ProductsManager>(builder: (context, manager, child) {
        bool isEng = manager.getLocal();
        return Scaffold(
          //resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            //reverse: true,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        left: 15,
                        right: 15,
                      ),
                      child: Text(
                        isEng ? 'SIGN UP' : 'إنشاء حساب',
                        style: GoogleFonts.archivoBlack(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                      ),
                      child: SizedBox(
                        height: height / 2.5,
                        width: width,
                        child: Image.asset(
                          'assets/signup.jpg',
                          semanticLabel: 'login',
                          height: height / 2.5,
                          width: width,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 27,
                              vertical: 15,
                            ),
                            child: Directionality(
                              textDirection:
                                  isEng ? TextDirection.ltr : TextDirection.rtl,
                              child: TextFormField(
                                controller: nameController,
                                focusNode: nameFocusNode,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      8,
                                    ),
                                    borderSide: const BorderSide(
                                      width: 2,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                    borderSide: const BorderSide(
                                      width: 2,
                                      color: Colors.black26,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      8,
                                    ),
                                    borderSide: const BorderSide(
                                      width: 2,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  hintText:
                                      isEng ? 'Enter your Name' : 'أدخل اسمك',
                                  icon: FaIcon(
                                    FontAwesomeIcons.idCard,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  fillColor: Colors.blueGrey,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 27,
                              vertical: 5,
                            ),
                            child: Directionality(
                              textDirection:
                                  isEng ? TextDirection.ltr : TextDirection.rtl,
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                controller: phoneNumberController,
                                focusNode: phoneNumberFocusNode,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      8,
                                    ),
                                    borderSide: const BorderSide(
                                      width: 2,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                    borderSide: const BorderSide(
                                      width: 2,
                                      color: Colors.black26,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      8,
                                    ),
                                    borderSide: const BorderSide(
                                      width: 2,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  hintText: isEng
                                      ? 'Enter your phone number'
                                      : 'أدخل رقم الهاتف الخاص بك',
                                  icon: FaIcon(
                                    Icons.phone,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  fillColor: Colors.blueGrey,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 27,
                              vertical: 15,
                            ),
                            child: Directionality(
                              textDirection:
                                  isEng ? TextDirection.ltr : TextDirection.rtl,
                              child: TextFormField(
                                controller: facebookController,
                                focusNode: facebookFocusNode,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      8,
                                    ),
                                    borderSide: const BorderSide(
                                      width: 2,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                    borderSide: const BorderSide(
                                      width: 2,
                                      color: Colors.black26,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      8,
                                    ),
                                    borderSide: const BorderSide(
                                      width: 2,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  hintText: isEng
                                      ? 'Enter your facebook account'
                                      : 'أدخل حساب الفيسبوك الخاص بك',
                                  icon: FaIcon(
                                    FontAwesomeIcons.facebook,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  fillColor: Colors.blueGrey,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                            ),
                            child: AnimatedButton(
                              onPressed: () async {
                                Provider.of<ProductsManager>(context,
                                        listen: false)
                                    .setNameNumber(
                                  nameController.text,
                                  phoneNumberController.text,
                                  facebookController.text,
                                );
                                try {
                                  SignupData signupData =
                                      await Provider.of<ProductsManager>(
                                    context,
                                    listen: false,
                                  ).signUp2();
                                  if (signupData.token != 'error') {
                                    Provider.of<ProductsManager>(context,
                                            listen: false)
                                        .setToken(signupData.token);
                                    Provider.of<ProductsManager>(context,
                                            listen: false)
                                        .setUser(signupData.user);
                                    Navigator.pushReplacementNamed(
                                        context, '/verification');
                                  }
                                } catch (e) {
                                  try {
                                    final result = await InternetAddress.lookup(
                                        'example.com');
                                    if (result.isNotEmpty &&
                                        result[0].rawAddress.isNotEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(isEng
                                              ? 'Check your info and try again'
                                              : 'تأكد من بياناتك ثم أعد المحاولة'),
                                        ),
                                      );
                                    }
                                  } on SocketException catch (_) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(isEng
                                            ? 'Check your internet connection'
                                            : 'تأكد من اتصالك بالإنترنت ثم أعد المحاولة'),
                                      ),
                                    );
                                  }
                                }
                              },
                              color: Colors.blueGrey,
                              width: width / 2.5,
                              height: height / 14,
                              child: Text(
                                isEng ? 'SIGN UP' : 'إنشاء حساب',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: GoogleFonts.arya(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15,
                            ),
                            child: Directionality(
                              textDirection:
                                  isEng ? TextDirection.ltr : TextDirection.rtl,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    isEng
                                        ? "Already have an account?"
                                        : 'لديك حساب مسجل مسبقا؟',
                                    style: GoogleFonts.actor(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.popAndPushNamed(
                                        context,
                                        '/log_in',
                                      );
                                    },
                                    child: Text(
                                      isEng ? 'Log in' : 'تسجيل الدخول',
                                      style: GoogleFonts.actor(
                                        color: Colors.blueGrey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
