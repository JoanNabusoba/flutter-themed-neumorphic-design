// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:game/home.dart';
import 'package:game/utils/ThemeModal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class PainterCard extends StatelessWidget {
  const PainterCard({Key? key, required this.item, required this.index})
      : super(key: key);
  final ListItem item;
  final index;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModal themeNotifier, child) {
      return Container(
        height: (MediaQuery.of(context).size.width * .56) + 40,
        margin: const EdgeInsets.only(top: 55),
        child: Stack(
          children: [
            Transform(
              transform: Matrix4.skewY(-.16),
              child: Neumorphic(
                style: NeumorphicStyle(
                  intensity: .2,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: themeNotifier.isDark
                          ? Color.fromRGBO(44, 53, 70, 1)
                          : Color.fromRGBO(243, 248, 252, 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                  height: 100.0,
                  width: MediaQuery.of(context).size.width * .55,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 12, top: 5),
                        child: Icon(
                          MdiIcons.sonyPlaystation,
                          color: Colors.white24,
                          size: 36,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: MediaQuery.of(context).size.width * .56,
              width: MediaQuery.of(context).size.width * .55,
              decoration: BoxDecoration(
                  color: themeNotifier.isDark
                      ? Color.fromRGBO(44, 53, 70, 1)
                      : Color.fromRGBO(230,238,246, 1),

                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              child: Neumorphic(
                style: NeumorphicStyle(
                    intensity: .2,
                    lightSource: LightSource.bottom,
      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)
      )),
                    color: themeNotifier.isDark
                        ? Color.fromRGBO(44, 53, 70, 1)
                        : Color.fromRGBO(243, 248, 252, 1.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 25),
                        child: Hero(
                            tag: "image${index}",
                            child: Image(image: AssetImage(item.image)))),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Hero(
                          tag: "textTitle${index}",
                          child: Text(item.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.play(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(fontWeight: FontWeight.w700))),
                        )),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      child: Text(item.subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              textStyle:
                                  Theme.of(context).textTheme.subtitle2)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}

// class Chevron extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final Gradient gradient = new LinearGradient(
//       begin: Alignment.topCenter,
//       end: Alignment.bottomCenter,
//       colors: [Colors.orangeAccent, Colors.yellow],
//       tileMode: TileMode.clamp,
//     );
//
//     final Rect colorBounds = Rect.fromLTRB(0, 0, size.width, size.height);
//     final Paint paint = new Paint()
//       ..shader = gradient.createShader(colorBounds);
//
//     Path path = Path();
//
//     path.moveTo(0, 30);
//     path.quadraticBezierTo(0, size.height, 10, size.height * 0.9);
//     //path.lineTo(0, size.height);
//     //path.lineTo(size.width / 2, size.height - size.height / 3);
//     path.lineTo(size.width, size.height);
//     path.lineTo(size.width, 0);
//     path.close();
//
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
