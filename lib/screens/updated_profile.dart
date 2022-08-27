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
                    Container(
                      width: responsiveSize.getWidth(50, context),
                      height: responsiveSize.getHeight(50, context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10,),
                        color: Colors.white70,
                        shape: BoxShape.rectangle,
                      ),
                      child: Icon(Icons.local_activity_sharp),
                    ),
                    Container(
                      width: responsiveSize.getWidth(50, context),
                      height: responsiveSize.getHeight(50, context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10,),
                        color: Colors.white70,
                        shape: BoxShape.rectangle,
                      ),
                      child: Icon(Icons.local_activity_sharp),
                    ),
                    Container(
                      width: responsiveSize.getWidth(50, context),
                      height: responsiveSize.getHeight(50, context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10,),
                        color: Colors.white70,
                        shape: BoxShape.rectangle,
                      ),
                      child: Icon(Icons.local_activity_sharp),
                    ),
                    Container(
                      width: responsiveSize.getWidth(50, context),
                      height: responsiveSize.getHeight(50, context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10,),
                        color: Colors.white70,
                        shape: BoxShape.rectangle,
                      ),
                      child: Icon(Icons.local_activity_sharp),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
