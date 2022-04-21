import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import '../models/models.dart';
import '../services/data_services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    var q = min(height, width);
    Provider.of<ProductsManager>(context, listen: false).getProfile();
    return Consumer<ProductsManager>(builder: (context, manager, child) {
      bool isEng = manager.getLocal();
      var user =
          Provider.of<ProductsManager>(context, listen: false).getProfile();
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blueGrey,
          title: Text(
            isEng ? 'Profile' : 'الحساب',
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            // const Center(
            //   child: CircleAvatar(
            //     maxRadius: 50,
            //     child: Image(
            //       image: AssetImage('assets/blank-profile.png'),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),
            Text(
              user['name'].toString(),
            ),
            Text(
              user['email'].toString(),
            ),
            Text(
              user['phone number'].toString(),
            ),
            Text(
              user['facebook'].toString(),
            ),
          ],
        ),
      );
    });
  }
}
