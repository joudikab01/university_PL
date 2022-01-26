import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'screens.dart';
import 'dart:math';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  Widget customTextButton(
      context, double width, double height, String text1, String route) {
    var q = min(height, width);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: q / 100, vertical: q / 50),
      child: SizedBox(
        width: width - width / 12,
        height: height / 16,
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            elevation: MaterialStateProperty.all(4),
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(horizontal: q / 100, vertical: q / 50),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
            shadowColor: MaterialStateProperty.all(Colors.blueGrey[300]),
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/$route');
          },
          child: Text(
            text1,
            style: TextStyle(color: Colors.white, fontSize: q / 20),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    var q = min(height, width);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
              ),
              child: SizedBox(
                height: height / 2,
                //width: width,
                child: SvgPicture.asset('assets/business.svg'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 8, right: 8),
              child: Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: q / 16,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
              child: Text(
                'online shopping makes life easier',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: q / 22,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 8, right: 8),
              child:
                  customTextButton(context, width, height, 'Log in', 'log_in'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 8, right: 8),
              child: customTextButton(
                  context, width, height, 'Sign up', 'sign_up'),
            ),
          ],
        ),
      ),
    );
  }
}
