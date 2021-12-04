// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ActiveBottomnavButton extends StatelessWidget {
  const ActiveBottomnavButton(
      {Key? key, required this.icon, required this.title})
      : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: const [
                    Color(0xFF3AAAEA),
                    Color(0xFF494EE7),
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 1.0),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp),
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 12),
              Icon(icon, color: Colors.white),
              SizedBox(width: 7),
              Neumorphic(
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.concave,
                  ),
                  child: Container(height: 40, width: .8, color: Colors.grey[600])),
              SizedBox(width: 7),
              Text(title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: Colors.white, fontWeight: FontWeight.w500))),
              SizedBox(width: 12),
            ],
          ),
        ),
      ],
    );
  }
}
