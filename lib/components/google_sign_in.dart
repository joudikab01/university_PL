import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'firebase_service.dart';

class GoogleSignIn extends StatefulWidget {
  final BuildContext context;
  const GoogleSignIn(this.context, {Key? key}) : super(key: key);

  @override
  _GoogleSignInState createState() => _GoogleSignInState();
}

class _GoogleSignInState extends State<GoogleSignIn> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return !isLoading
        ? SizedBox(
            width: size.width * 0.8,
            height: size.height / 14,
            child: OutlinedButton.icon(
              icon: const FaIcon(
                FontAwesomeIcons.google,
                color: Colors.blueGrey,
              ),
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                FirebaseService service = FirebaseService();
                try {
                  print('before');
                  String? abd = await service.signInWithGoogle(widget.context);
                  print('after');
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: SingleChildScrollView(
                                child: Text(
                              abd??"",
                              style: const TextStyle(
                                fontSize: 7,
                              ),
                            )),
                          ));
                } catch (e) {
                  if (e is FirebaseAuthException) {
                    showMessage(e.message!);
                  }
                }
                setState(() {
                  isLoading = false;
                });
              },
              label: const Text(
                'Sign in with Google',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.white.withBlue(245).withGreen(245).withRed(245)),
                  side: MaterialStateProperty.all<BorderSide>(BorderSide.none)),
            ),
          )
        : const CircularProgressIndicator();
  }

  void showMessage(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text(message),
            actions: [
              TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
