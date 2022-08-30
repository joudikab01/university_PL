import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/providers.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  Widget customTextButton(context, double width, double height, String text1,
      String route, bool isEng) {
    var q = min(height, width);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 12,
      ),
      child: SizedBox(
        width: width - width / 12,
        height: height / 16,
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
            ),
            elevation: MaterialStateProperty.all(
              4,
            ),
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(
                horizontal: q / 100,
                vertical: q / 50,
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              Colors.blueGrey,
            ),
            shadowColor: MaterialStateProperty.all(
              Colors.blueGrey[300],
            ),
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              '/$route',
            );
          },
          child: Text(
            text1,
            overflow: TextOverflow.ellipsis,
            style: isEng
                ? GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 16,
                  )
                : GoogleFonts.tajawal(
                    color: Colors.white,
                    fontSize: 16,
                  ),
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
    return SafeArea(
      child: Consumer<ProductsManager>(builder: (context, manager, child) {
        bool isEng = manager.getLocal();
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: height / 2,
                //width: width,
                child: SvgPicture.asset(
                  'assets/business.svg',
                  fit: BoxFit.contain,
                  //color: Colors.yellowAccent,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 0,
                      left: 8,
                      right: 8,
                    ),
                    child: Text(
                      isEng ? 'Welcome' : 'أهلا بك',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 8,
                      right: 8,
                    ),
                    child: Text(
                      isEng
                          ? 'online shopping makes life easier'
                          : 'الشراء عبر الإنترنت يجعل الحياة أبسط',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                      left: 8,
                      right: 8,
                    ),
                    child: customTextButton(
                      context,
                      width,
                      height,
                      isEng ? 'Log in' : 'تسجيل الدخول',
                      'log_in',
                      isEng,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                      left: 8,
                      right: 8,
                    ),
                    child: customTextButton(
                      context,
                      width,
                      height,
                      isEng ? 'Sign up' : 'إنشاء حساب',
                      'sign_up',
                      isEng,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
