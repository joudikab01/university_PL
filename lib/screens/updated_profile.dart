import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import '../models/models.dart';
import '../components/components.dart';
import '../responsive.dart';

class UpdatedProfile extends StatefulWidget {
  const UpdatedProfile({Key? key}) : super(key: key);

  @override
  State<UpdatedProfile> createState() => _UpdatedProfileState();
}

class _UpdatedProfileState extends State<UpdatedProfile> {
  int stackIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      35,
                    ),
                    bottomRight: Radius.circular(
                      35,
                    ),
                  ),
                ),
              ),
              Positioned(
                width: MediaQuery.of(context).size.width,
                bottom: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {

                          stackIndex = 0;
                        });
                        print(stackIndex);
                      },
                      child: Container(
                        width: responsiveSize.getWidth(50, context),
                        height: responsiveSize.getHeight(50, context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          color: Colors.white70,
                          shape: BoxShape.rectangle,
                        ),
                        child: Icon(Icons.local_activity_sharp),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {

                          stackIndex = 1;
                        });
                        print(stackIndex);
                      },
                      child: Container(
                        width: responsiveSize.getWidth(50, context),
                        height: responsiveSize.getHeight(50, context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          color: Colors.white70,
                          shape: BoxShape.rectangle,
                        ),
                        child: Icon(Icons.local_activity_sharp),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {

                          stackIndex = 2;
                        });
                        print(stackIndex);
                      },
                      child: Container(
                        width: responsiveSize.getWidth(50, context),
                        height: responsiveSize.getHeight(50, context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          color: Colors.white70,
                          shape: BoxShape.rectangle,
                        ),
                        child: Icon(Icons.local_activity_sharp),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          stackIndex = 3;
                        });
                      },
                      child: Container(
                        width: responsiveSize.getWidth(50, context),
                        height: responsiveSize.getHeight(50, context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          color: Colors.white70,
                          shape: BoxShape.rectangle,
                        ),
                        child: Icon(Icons.local_activity_sharp),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            color: Colors.yellowAccent,
            width: double.infinity,
            height: 300,
            child: IndexedStack(
              index: stackIndex,
              children: [
                Orders(),
                Favorites(),
                Info(),
                Notifications(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.green,
          );
        });
  }
}

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.red,
          );
        });
  }
}

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.pink,
          );
        });
  }
}

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.purple,
          );
        });
  }
}
