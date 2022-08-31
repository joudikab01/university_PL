import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';

class SignUpScreen extends StatefulWidget {
  final String? email;
  final String? password;
  final String? confirm;
  const SignUpScreen({this.email, this.password, this.confirm, Key? key})
      : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final secondPasswordController = TextEditingController();
  late FocusNode secondPasswordFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  bool hidePassword = true;
  String? password;
  String? email;

  @override
  void initState() {
    emailFocusNode = FocusNode();
    secondPasswordFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    secondPasswordController.dispose();
    secondPasswordFocusNode.dispose();
    super.dispose();
  }

  void validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      Provider.of<ProductsManager>(
        context,
        listen: false,
      ).setEmailPassword(
        emailController.text,
        passwordController.text,
      );
      Navigator.pushReplacementNamed(
        context,
        '/second_sign_up',
      );
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
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
                                validator: (text) {
                                  if (text == null || text == '') {
                                    return isEng
                                        ? 'Cannot be empty'
                                        : 'لا يمكن أن يكون فارغ';
                                  }
                                  if (text.length <= 4) {
                                    return isEng
                                        ? 'Invalid Email'
                                        : 'بريد إلكتروني خاطئ';
                                  }
                                  if (!text.contains('@') ||
                                      !text.contains('.')) {
                                    return isEng
                                        ? 'Invalid Email format'
                                        : 'صيغة بريد إلكتروني خاطئة';
                                  }
                                  return null;
                                },
                                controller: emailController,
                                focusNode: emailFocusNode,
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
                                          width: 2, color: Colors.black26),
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
                                        ? 'Enter your Email'
                                        : 'أدخل بريدك الإلكتروني',
                                    icon: const FaIcon(
                                      Icons.email_rounded,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                    fillColor: Colors.blueGrey),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 27,
                              vertical: 10,
                            ),
                            child: Directionality(
                              textDirection:
                                  isEng ? TextDirection.ltr : TextDirection.rtl,
                              child: TextFormField(
                                obscureText: hidePassword,
                                controller: passwordController,
                                focusNode: passwordFocusNode,
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
                                      ? 'Enter your password'
                                      : 'أدخل كلمة السر',
                                  icon: const FaIcon(
                                    FontAwesomeIcons.lock,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  suffixIcon: IconButton(
                                    color: Colors.grey,
                                    padding: const EdgeInsets.only(
                                      right: 10,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        hidePassword = !hidePassword;
                                      });
                                    },
                                    icon: Icon(!hidePassword
                                        ? Icons.remove_red_eye_rounded
                                        : Ionicons.eye_off),
                                    iconSize: 18,
                                  ),
                                  suffixStyle:
                                      const TextStyle(color: Colors.black),
                                ),
                                validator: (text) {
                                  if (text == '') {
                                    return isEng
                                        ? 'cant be empty'
                                        : 'لا يمكن أن يكون فارغ';
                                  }
                                },
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
                                validator: (text) {
                                  if (text == '') {
                                    return isEng
                                        ? 'cant be empty'
                                        : 'لا يمكن أن يكون فارغ';
                                  }
                                  if (text != passwordController.text) {
                                    return isEng
                                        ? 'check your password'
                                        : 'تأكد من كلمة السر الخاصة بك';
                                  }
                                },
                                obscureText: hidePassword,
                                controller: secondPasswordController,
                                focusNode: secondPasswordFocusNode,
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
                                      ? 'Confirm your password'
                                      : 'تأكيد كلمة السر',
                                  icon: const FaIcon(
                                    FontAwesomeIcons.lock,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                            ),
                            child: AnimatedButton(
                              onPressed: validateAndSave,
                              color: Colors.blueGrey,
                              width: width / 2.5,
                              height: height / 14,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Expanded(
                                    child: SizedBox(),
                                  ),
                                  Text(
                                    isEng ? 'Continue ' : 'إستمرار',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: GoogleFonts.arya(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const FaIcon(
                                    FontAwesomeIcons.anglesRight,
                                    color: Colors.white,
                                    //size: 15,
                                  ),
                                  const Expanded(
                                    child: SizedBox(),
                                  ),
                                ],
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
