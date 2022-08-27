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
  static List<Widget> pages = <Widget>[
    Orders(),
    Favorites(),
    Info(),
    Notifications(),
  ];

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
                      onTap: () {
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
                      onTap: () {
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
                      onTap: () {
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
                      onTap: () {
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
              children: pages,
            ),
          ),
        ],
      ),
    );
  }
}

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
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

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
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

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
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

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
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
