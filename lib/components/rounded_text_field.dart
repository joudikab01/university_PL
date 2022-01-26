import 'package:flutter/material.dart';
import 'dart:math';

class RoundedContainer extends StatelessWidget {
  final Widget textFrom;
  const RoundedContainer({
    Key? key,
    required this.textFrom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    var q = min(height, width);
    return Container(
        width: width - width / 12,
        height: height / 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29),
          color: Colors.blueGrey[100],
        ),
        child: textFrom);
  }
}
