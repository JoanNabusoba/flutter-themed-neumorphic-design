import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:game/utils/ThemeModal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AboutCard extends StatelessWidget {
  const AboutCard(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.icon,
      required this.iconColor})
      : super(key: key);

  final String title, subTitle;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModal themeNotifier, child)
    {
      return Row(
        children: [
          SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .width * .15,
            width: MediaQuery
                .of(context)
                .size
                .width * .15,
            child: Neumorphic(
              style: NeumorphicStyle(
                intensity: .6,
                shadowLightColor: Colors.black26,
                boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.circular(12)),
                color: themeNotifier.isDark?Color.fromRGBO(33, 39, 52, 1):Color.fromRGBO(229, 237, 245, 1),
                shadowDarkColor: Colors.black87,
              ),
              child: Stack(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .width * .129,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .129,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black26)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .width * .1,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black26)),
                      child: Icon(
                        icon,
                        size: MediaQuery
                            .of(context)
                            .size
                            .width * .08,
                        color: iconColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title,
                  style: GoogleFonts.poppins(
                      textStyle: Theme
                          .of(context)
                          .textTheme
                          .subtitle1)),
              Text(subTitle,
                  style: GoogleFonts.poppins(
                      textStyle: Theme
                          .of(context)
                          .textTheme
                          .subtitle2))
            ],
          )
        ],
      );
    });
  }
}
