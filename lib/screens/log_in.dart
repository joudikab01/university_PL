import 'dart:io';
import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/models.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  bool hidePassword =true;
  @override
  void initState() {
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
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
            reverse: true,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      isEng ? 'LOGIN' : 'تسجيل الدخول',
                      style: isEng
                          ? GoogleFonts.archivoBlack(
                              color: Colors.black,
                              fontSize: q / 20,
                              fontWeight: FontWeight.bold,
                            )
                          : GoogleFonts.tajawal(
                              color: Colors.black,
                              fontSize: q / 20,
                              fontWeight: FontWeight.bold,
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: SizedBox(
                      height: height / 3,
                      width: width,
                      child: SvgPicture.asset(
                        'assets/login.svg',
                        semanticsLabel: 'login',
                        height: height / 3,
                        width: width,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 15),
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
                          if (!text.contains('@') || !text.contains('.')) {
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
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.black26),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Colors.blueGrey,
                              ),
                            ),
                            hintText: isEng
                                ? 'Enter your Email'
                                : 'أدخل بريدك الإلكتروني',
                            icon: FaIcon(
                              Icons.mail_rounded,
                              color: Colors.black,
                              size: q / 20,
                            ),
                            fillColor: Colors.blueGrey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 15),
                    child: Directionality(
                      textDirection:
                          isEng ? TextDirection.ltr : TextDirection.rtl,
                      child: TextFormField(
                        obscureText: hidePassword,
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                        cursorColor: Colors.black,
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
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 2, color: Colors.black26),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.blueGrey,
                            ),
                          ),
                          hintText:
                              isEng ? 'Enter your password' : 'أدخل كلمة السر',
                          icon: FaIcon(
                            FontAwesomeIcons.lock,
                            color: Colors.black,
                            size: q / 20,
                          ),
                          suffixIcon: IconButton(
                            color: Colors.grey,
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            icon: Icon(!hidePassword
                                ? Icons.remove_red_eye_rounded
                                : Ionicons.eye_off),
                            iconSize: q / 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: AnimatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          Provider.of<ProductsManager>(context, listen: false)
                              .setLoginData(emailController.text,
                                  passwordController.text);
                          try {
                            Login login = await Provider.of<ProductsManager>(
                                    context,
                                    listen: false)
                                .logIn();
                            if (login.token != 'error') {
                              Provider.of<ProductsManager>(context,
                                      listen: false)
                                  .setToken(login.token);
                              Provider.of<ProductsManager>(context,listen: false).setUser(login.user);
                              Navigator.pushReplacementNamed(context, '/home');
                            }
                          } catch (e) {
                            try {
                              final result =
                                  await InternetAddress.lookup('example.com');
                              if (result.isNotEmpty &&
                                  result[0].rawAddress.isNotEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
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
                        } else {
                          return null;
                        }
                      },
                      child: Text(
                        isEng ? 'Log In' : 'تسجيل الدخول',
                        style: GoogleFonts.arya(
                            fontSize: q / 22, color: Colors.white),
                      ),
                      color: Colors.blueGrey,
                      width: width / 3.5,
                      height: height / 14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 22),
                    child: Directionality(
                      textDirection:
                          isEng ? TextDirection.ltr : TextDirection.rtl,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isEng ? "Don't have an account?" : 'لا تملك حساب؟',
                            style: isEng
                                ? GoogleFonts.actor(
                                    color: Colors.black, fontSize: q / 26)
                                : GoogleFonts.tajawal(
                                    color: Colors.black, fontSize: q / 26),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.popAndPushNamed(context, '/sign_up');
                            },
                            child: Text(
                              isEng ? 'Sign Up' : 'إنشاء حساب',
                              style: GoogleFonts.actor(
                                  color: Colors.blueGrey, fontSize: q / 22),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
