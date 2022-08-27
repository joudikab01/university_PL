import 'package:flutter/material.dart';
import '../responsive.dart';

class UpdatedProfile extends StatefulWidget {
  const UpdatedProfile({Key? key}) : super(key: key);

  @override
  State<UpdatedProfile> createState() => _UpdatedProfileState();
}

class _UpdatedProfileState extends State<UpdatedProfile> {
  static List<Widget> pages = <Widget>[
    const Orders(),
    const Favorites(),
    const Info(),
    const Notifications(),
  ];

  int stackIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
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
                decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      35,
                    ),
                    bottomRight: Radius.circular(
                      35,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.supervised_user_circle_outlined,
                        size: 50,
                        color: Colors.blueGrey,
                      ),
                      radius: 40,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'joudi.kab01@gmail.com',
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 60),
                      child: Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 30,
                      ),
                    )
                  ],
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
                      },
                      child: Container(
                        width: responsiveSize.getWidth(60, context),
                        height: responsiveSize.getHeight(60, context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(2, 5),
                                blurRadius: 10,
                                blurStyle: BlurStyle.inner),
                          ],
                        ),
                        child: const Icon(Icons.favorite_border),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          stackIndex = 1;
                        });
                      },
                      child: Container(
                        width: responsiveSize.getWidth(60, context),
                        height: responsiveSize.getHeight(60, context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(2, 5),
                                blurRadius: 10,
                                blurStyle: BlurStyle.inner),
                          ],
                        ),
                        child: const Icon(
                          Icons.notifications_none_rounded,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          stackIndex = 2;
                        });
                      },
                      child: Container(
                        width: responsiveSize.getWidth(60, context),
                        height: responsiveSize.getHeight(60, context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(2, 5),
                                blurRadius: 10,
                                blurStyle: BlurStyle.inner),
                          ],
                        ),
                        child: const Icon(
                          Icons.account_circle_outlined,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          stackIndex = 3;
                        });
                      },
                      child: Container(
                        width: responsiveSize.getWidth(60, context),
                        height: responsiveSize.getHeight(60, context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(2, 5),
                                blurRadius: 10,
                                blurStyle: BlurStyle.inner),
                          ],
                        ),
                        child: const Icon(
                          Icons.shopping_cart_outlined,
                        ),
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
