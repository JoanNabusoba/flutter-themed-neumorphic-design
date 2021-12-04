// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:game/utils/ThemeModal.dart';
import 'package:game/widgets/about_order_bottomnav.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import 'widgets/about_card.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModal themeNotifier, child) {
      return Scaffold(
        //backgroundColor: Color.fromRGBO(33, 39, 52, 1),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ///first blue area
              Container(
                //height: MediaQuery.of(context).size.height ,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color(0xFF3AAAEA),
                        Color(0xFF494EE7),
                      ],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(0.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: Column(
                  children: [
                    const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 0)),
                    Row(
                      children: [
                        const Padding(padding: EdgeInsets.only(left: 16)),

                        ///Neumphonic Button
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              CupertinoIcons.arrow_left,
                              color: Colors.white,
                              size: 28,
                            )),
                        Expanded(
                          child: Container(),
                        ),

                        ///Neumphonic Button
                        InkWell(
                          child: Neumorphic(
                              style: NeumorphicStyle(
                                  shape: NeumorphicShape.concave,
                                  boxShape: NeumorphicBoxShape.circle(),
                                  depth: 4,
                                  intensity: .5,
                                  //surfaceIntensity: .2,
                                  shadowDarkColor: Colors.black,
                                  shadowLightColor: Colors.transparent,
                                  lightSource: LightSource.topLeft,
                                  color: themeNotifier.isDark
                                      ? Color.fromRGBO(33, 39, 52, 1)
                                      : Color.fromRGBO(229, 237, 245, 1)),
                              child: Container(
                                  padding: const EdgeInsets.all(14),
                                  height: 55,
                                  width: 55,
                                  child: Stack(
                                    children: [
                                      Icon(Icons.shopping_cart_outlined,
                                          color: themeNotifier.isDark
                                              ? Color.fromRGBO(229, 237, 245, 1)
                                              : Color.fromRGBO(33, 39, 52, 1),
                                          size: 26),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          height: 10,
                                          width: 10,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFF3AAAEA)),
                                        ),
                                      )
                                    ],
                                  ))),
                        ),
                        const Padding(padding: EdgeInsets.only(right: 20)),
                      ],
                    ),
                    const SizedBox(height: 20),

                    ///text section
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Platform".toUpperCase(),
                                  style: GoogleFonts.poppins(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(
                                              color: Colors.white,
                                              letterSpacing: 1.2))),
                              Text("PS5".toUpperCase(),
                                  style: GoogleFonts.poppins(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w400))),

                              ///Space
                              SizedBox(height: 16),
                              Text("release".toUpperCase(),
                                  style: GoogleFonts.poppins(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(
                                              color: Colors.white,
                                              letterSpacing: 1.2))),
                              Text("Autumn 2021",
                                  style: GoogleFonts.poppins(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w400))),

                              ///Space
                              SizedBox(height: 16),
                              Text("price".toUpperCase(),
                                  style: GoogleFonts.poppins(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(
                                              color: Colors.white,
                                              letterSpacing: 1.2))),
                              Text("\$49",
                                  style: GoogleFonts.poppins(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w400))),

                              ///Space
                              SizedBox(height: 40),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              ///End of first blue area
              ///The dark area
              Positioned(
                top: MediaQuery.of(context).size.height * .415,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height * .6,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .6,
                    color: themeNotifier.isDark
                        ? Color.fromRGBO(33, 39, 52, 1)
                        : Color.fromRGBO(229, 237, 245, 1),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 20),
                          Hero(
                            tag: "textTitle0",
                            child: Text("Dual Sense",
                                style: GoogleFonts.play(
                                    textStyle:
                                        Theme.of(context).textTheme.headline4)),
                          ),
                          SizedBox(height: 12),
                          Text(
                              "Dual sense has a built-in microphone array, which will enable players to easily chat with with friends without a headset plugged in your PS or PC",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(
                                          height: 1.5,
                                          letterSpacing: .6,
                                          fontWeight: FontWeight.w400))),
                          SizedBox(height: 25),
                          Row(
                            children: [
                              Expanded(
                                child: AboutCard(
                                    title: "Futuristic",
                                    subTitle: "Design",
                                    icon:
                                        CupertinoIcons.gamecontroller_alt_fill,
                                    iconColor: Color.fromRGBO(48, 178, 226, 1)),
                              ),
                              Expanded(
                                  child: AboutCard(
                                      title: "Built-in",
                                      subTitle: "Microphone",
                                      icon: Icons.mic,
                                      iconColor:
                                          Color.fromRGBO(79, 131, 235, 1)))
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: AboutCard(
                                    title: "Fast",
                                    subTitle: "Feedback",
                                    icon: Icons.gamepad_outlined,
                                    iconColor: Color.fromRGBO(191, 89, 237, 1)),
                              ),
                              Expanded(
                                  child: AboutCard(
                                      title: "Fast charge",
                                      subTitle: "USB-C Port",
                                      icon: Icons.bolt_outlined,
                                      iconColor:
                                          Color.fromRGBO(135, 89, 237, 1)))
                            ],
                          ),
                          SizedBox(
                            height: 400,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              ///End of dark area
              ///FAB
              Positioned(
                child: Neumorphic(
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.concave,
                    boxShape: NeumorphicBoxShape.circle(),
                    depth: 4,
                    intensity: .5,
                    //surfaceIntensity: .2,
                    shadowDarkColor: Colors.black,
                    shadowLightColor: Colors.transparent,
                    lightSource: LightSource.topLeft,
                    color: Color.fromRGBO(33, 39, 52, 1),
                  ),
                  child: FloatingActionButton(
                      backgroundColor: Color.fromRGBO(33, 39, 52, 1),
                      onPressed: () {},
                      child:
                          Icon(CupertinoIcons.bookmark, color: Colors.white70)),
                ),
                left: 20,
                top: MediaQuery.of(context).size.height * .378,
              ),

              ///Floating image section
              Positioned(
                right: 0,
                top: 150,
                child: Container(
                  height: MediaQuery.of(context).size.height * .21,
                  child: Transform.rotate(
                    angle: -math.pi / 2,
                    child: Container(
                        child: Hero(
                            tag: "image0",
                            child: Image.asset("assets/images/ps1.png"))),
                  ),
                ),
              ),

              ///End of floating image
              ///Order section
              Positioned(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  bottom: 20,
                  child: Neumorphic(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          // border: NeumorphicBorder(
                          //     width: 1, color: Color.fromRGBO(44, 52, 69, 1.0)),
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(12)),
                          shadowDarkColor: Colors.black87,
                          depth: 2,
                          intensity: .4,
                          lightSource: LightSource.topLeft,
                          color: themeNotifier.isDark
                              ? Color.fromRGBO(33, 39, 52, 1)
                              : Color.fromRGBO(229, 237, 245, 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Text("\$",
                                    style: GoogleFonts.poppins(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w500))),
                                SizedBox(width: 2),
                                Text("49",
                                    style: GoogleFonts.poppins(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                                fontWeight: FontWeight.w500))),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: AboutBottomnav(
                                icon: MdiIcons.arrowRight, title: "Preorder"),
                          ),
                        ],
                      ))),

              ///End of order section
            ],
          ),
        ),
      );
    });
  }
}
