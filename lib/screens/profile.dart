import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import '../models/models.dart';
import '../components/components.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    double q = min(height, width);
    var box = Boxes.getUserBox();
    UserSign? userSign = box.get('userData');
    int id = userSign!.id;
    return FutureBuilder(
        future: Provider.of<ProductsManager>(context).getUserProducts(id),
        builder: (context, AsyncSnapshot<UserProducts> snapshot) {
          bool isEng =
              Provider.of<ProductsManager>(context, listen: false).getLocal();
          UserProducts userProducts = snapshot.data ??
              UserProducts(
                  products: [],
                  likes: [],
                  comments: [],
                  id: 0,
                  phoneNumber: '',
                  email: '',
                  name: '',
                  updatedAt: '',
                  createdAt: '',
                  facebookUrl: '',
                  emailVerifiedAt: '');
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      try {
                        String token =
                            Provider.of<ProductsManager>(context, listen: false)
                                .getToken();
                        var box = Boxes.getAuthBox();
                        box.clear();
                        Provider.of<ProductsManager>(context, listen: false)
                            .logOut('Bearer $token');
                        Navigator.popAndPushNamed(context, '/splash_screen');
                      } catch (e) {}
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ))
              ],
              elevation: 0,
              backgroundColor: Colors.blueGrey,
              title: Text(
                isEng ? 'Profile' : 'الحساب',
              ),
              centerTitle: true,
            ),
            body: ListView(
              primary: true,
              shrinkWrap: false,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/blank-profile.png'),
                      ),
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Not Supported yet')));
                        },
                        child: const Text(
                          'Change Profile Photo',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '  Name:       ',
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      userProducts.name,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.0),
                  child: Divider(
                    color: Colors.grey,
                    height: 2,
                    thickness: 1,
                    indent: 110,
                    endIndent: 20,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '  Email:        ',
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      userProducts.email,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.0),
                  child: Divider(
                    color: Colors.grey,
                    height: 2,
                    thickness: 1,
                    indent: 110,
                    endIndent: 20,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '  Number:   ',
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      userProducts.phoneNumber,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.0),
                  child: Divider(
                    color: Colors.grey,
                    height: 2,
                    thickness: 1,
                    indent: 110,
                    endIndent: 20,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '  Facebook: ',
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      userProducts.facebookUrl,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    'Your products: ',
                    style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                ),
                ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: userProducts.products.length,
                    itemBuilder: (context, index) {
                      return UserProduct(
                        product: userProducts.products[index],
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Your comments log: ',
                    style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                ),
                ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: userProducts.comments.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 11, left: 25),
                        child:
                            CommentTile(comment: userProducts.comments[index]),
                      );
                    }),
              ],
            ),
          );
        });
  }
}
