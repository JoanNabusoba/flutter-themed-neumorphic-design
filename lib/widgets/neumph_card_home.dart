import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomNeumpCard extends StatelessWidget {
  const CustomNeumpCard(
      {Key? key,
      this.isFlat = false,
      required this.icon,
      required this.color,
      required this.bgColor})
      : super(key: key);
  final isFlat;
  final IconData icon;
  final Color color, bgColor;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.width * .172,
      width: MediaQuery.of(context).size.width * .18,
      child: _getChild(context),
    );
  }

  Widget _getChild(BuildContext context) {
    if (!isFlat) {
      return Container(
        child: Icon(
          icon,
          size: MediaQuery.of(context).size.width * .086,
          color: color,
        ),
      );
    } else {
      return Neumorphic(
          style: NeumorphicStyle(
              shape: NeumorphicShape.convex,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
              shadowDarkColor: Colors.black,
              depth: 4,
              intensity: .4,
              lightSource: LightSource.topLeft,
              color: bgColor),
          child: Icon(
            icon,
            size: MediaQuery.of(context).size.width * .086,
            color: color,
          ));
    }
  }
}
