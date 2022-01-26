import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'dart:math';
//import '../models/models.dart';
import '../components/components.dart';
import 'package:ionicons/ionicons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SecondSignUpScreen extends StatefulWidget {
  const SecondSignUpScreen({Key? key}) : super(key: key);

  @override
  _SecondSignUpScreenState createState() => _SecondSignUpScreenState();
}

class _SecondSignUpScreenState extends State<SecondSignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final secondPasswordController = TextEditingController();
  late FocusNode secondPasswordFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  bool showPassword = false;
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    var q = min(height, width);
    return SafeArea(
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          reverse: true,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Text(
                    'SIGN UP',
                    style: GoogleFonts.archivoBlack(
                      color: Colors.black,
                      fontSize: q / 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: SizedBox(
                    height: height / 3,
                    width: width,
                    child: Image.asset(
                      'assets/signup.jpg',
                      semanticLabel: 'login',
                      height: height / 3,
                      width: width,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: RoundedContainer(
                    textFrom: Padding(
                      padding:
                          const EdgeInsets.only(left: 12, right: 12, bottom: 5),
                      child: TextFormField(
                        controller: emailController,
                        focusNode: emailFocusNode,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: 'Enter your Email',
                          icon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: FaIcon(
                              FontAwesomeIcons.solidUserCircle,
                              color: Colors.black,
                              size: q / 25,
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: RoundedContainer(
                    textFrom: Padding(
                      padding:
                          const EdgeInsets.only(left: 12, right: 12, bottom: 5),
                      child: TextFormField(
                        obscureText: showPassword,
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your password',
                          icon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: FaIcon(
                              FontAwesomeIcons.lock,
                              color: Colors.black,
                              size: q / 25,
                            ),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 7),
                            child: IconButton(
                              padding: const EdgeInsets.only(top: 5),
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              icon: Icon(showPassword
                                  ? Ionicons.eye_outline
                                  : Ionicons.eye),
                              iconSize: q / 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  //top:20,left:15,right:15,bottom:10
                  padding: const EdgeInsets.only(
                      top: 25, left: 15, right: 15, bottom: 17),
                  child: RoundedContainer(
                    textFrom: Padding(
                      padding:
                          const EdgeInsets.only(left: 12, right: 12, bottom: 5),
                      child: TextFormField(
                        obscureText: showPassword,
                        controller: secondPasswordController,
                        focusNode: secondPasswordFocusNode,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm your password',
                          icon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: FaIcon(
                              FontAwesomeIcons.lock,
                              color: Colors.black,
                              size: q / 25,
                            ),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 7),
                            child: IconButton(
                              padding: const EdgeInsets.only(top: 5),
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              icon: Icon(showPassword
                                  ? Ionicons.eye_outline
                                  : Ionicons.eye),
                              iconSize: q / 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: AnimatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: Text(
                      'Sign up',
                      style: GoogleFonts.arya(
                          fontSize: q / 22, color: Colors.white),
                    ),
                    color: Colors.blueGrey,
                    width: width / 4,
                    height: height / 14,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: GoogleFonts.actor(
                            color: Colors.black, fontSize: q / 23),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.popAndPushNamed(context, '/log_in');
                        },
                        child: Text(
                          'Log in',
                          style: GoogleFonts.actor(
                              color: Colors.blueGrey,
                              fontSize: q / 20,
                              fontWeight: FontWeight.bold),
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
  }
}
