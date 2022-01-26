import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/components.dart';
import 'package:ionicons/ionicons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  bool showPassword = false;
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
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  'LOGIN',
                  style: GoogleFonts.archivoBlack(
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
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                child: RoundedContainer(
                  textFrom: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextFormField(
                      controller: emailController,
                      focusNode: emailFocusNode,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: 'Enter your Email',
                        icon: FaIcon(
                          FontAwesomeIcons.solidUserCircle,
                          color: Colors.black,
                          size: q / 18,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                child: RoundedContainer(
                  textFrom: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextFormField(
                      obscureText: showPassword,
                      controller: passwordController,
                      focusNode: passwordFocusNode,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your password',
                        icon: FaIcon(
                          FontAwesomeIcons.lock,
                          color: Colors.black,
                          size: q / 18,
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(
                            right: 0,
                            top: 10,
                          ),
                          child: IconButton(
                            padding: const EdgeInsets.only(bottom: 30),
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                            icon: Icon(showPassword
                                ? Ionicons.eye_outline
                                : Ionicons.eye),
                            iconSize: q / 16,
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
                    'Log In',
                    style:
                        GoogleFonts.arya(fontSize: q / 22, color: Colors.white),
                  ),
                  color: Colors.blueGrey,
                  width: width / 4,
                  height: height / 14,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: GoogleFonts.actor(
                          color: Colors.black, fontSize: q / 26),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, '/sign_up');
                      },
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.actor(
                            color: Colors.blueGrey, fontSize: q / 22),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
