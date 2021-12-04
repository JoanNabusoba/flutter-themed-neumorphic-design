// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:game/about.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:switcher_button/switcher_button.dart';

import 'utils/ThemeModal.dart';
import 'widgets/active_bottomnav_button.dart';
import 'widgets/neumph_card_home.dart';
import 'widgets/painter_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

  static const List<ListItem> listItems = <ListItem>[
    ListItem(
        title: 'Dual Sense',
        subtitle: "Official PS5 Controller",
        image: "assets/images/ps1.png"),
    ListItem(
        title: 'Dual Sense',
        subtitle: "Official PS5 Controller",
        image: "assets/images/ps2.png"),
    ListItem(
        title: 'Dual Sense',
        subtitle: "Official PS5 Controller",
        image: "assets/images/ps1.png"),
    ListItem(
        title: 'Dual Sense',
        subtitle: "Official PS5 Controller",
        image: "assets/images/ps2.png"),
    ListItem(
        title: 'Dual Sense',
        subtitle: "Official PS5 Controller",
        image: "assets/images/ps1.png"),
    ListItem(
        title: 'Dual Sense',
        subtitle: "Official PS5 Controller",
        image: "assets/images/ps2.png"),
  ];
}

class _HomeState extends State<Home> {
  var cntrl = PageController(viewportFraction: .7);

  int currentPos = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModal themeNotifier, child) {
      return Scaffold(
        //backgroundColor: const Color.fromRGBO(33, 39, 52, 1),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              //____The side blue gradient
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: MediaQuery.of(context).size.height * .87,
                  width: MediaQuery.of(context).size.width * .45,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color(0xFF3AAAEA),
                            Color(0xFF494EE7),
                          ],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(0.0, 1.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(30))),
                ),
              ),
              //____End of the side blue gradient

              //____The main content
              SingleChildScrollView(
                child: Column(
                  children: [
                    //Some padding top
                    const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 0)),
                    Row(
                      children: [
                        const Padding(padding: EdgeInsets.only(left: 20)),
                        //Neumphonic Button
                        InkWell(
                          child: Neumorphic(
                              style: NeumorphicStyle(
                                  shape: NeumorphicShape.concave,
                                  boxShape: NeumorphicBoxShape.circle(),
                                  depth: 4,
                                  intensity: .35,
                                  shadowDarkColor: Colors.black,
                                  surfaceIntensity: .1,
                                  lightSource: LightSource.topLeft,
                                  color: themeNotifier.isDark
                                      ? Color.fromRGBO(33, 39, 52, 1)
                                      : Color.fromRGBO(229, 237, 245, 1)),
                              child: Container(
                                  padding: const EdgeInsets.all(14),
                                  child: Icon(Icons.sort_outlined,
                                      color: themeNotifier.isDark
                                          ? Color.fromRGBO(229, 237, 245, 1)
                                          : Color.fromRGBO(33, 39, 52, 1),
                                      size: 26))),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        //Neumphonic Button
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
                    const SizedBox(height: 30),
                    //Title section
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Featured",
                              style: GoogleFonts.play(
                                  textStyle:
                                      Theme.of(context).textTheme.headline4)),
                          Text("Products",
                              style: GoogleFonts.play(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.2,
                                          foreground: Paint()
                                            ..color = themeNotifier.isDark
                                                ? Colors.white
                                                : Colors.black87
                                            ..strokeWidth = 1
                                            ..style = PaintingStyle.stroke))),
                          const SizedBox(height: 35),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomNeumpCard(
                                  isFlat: false,
                                  color: themeNotifier.isDark
                                      ? Colors.white70
                                      : Color.fromRGBO(33, 39, 52, 1),
                                  bgColor: Colors.transparent,
                                  icon: CupertinoIcons.slider_horizontal_3),
                              CustomNeumpCard(
                                  isFlat: true,
                                  color: Colors.white,
                                  bgColor: themeNotifier.isDark
                                      ? Color(0xFF3AAAEA)
                                      : Color.fromRGBO(33, 39, 52, 1),
                                  icon: CupertinoIcons.game_controller),
                              CustomNeumpCard(
                                  isFlat: true,
                                  bgColor: themeNotifier.isDark
                                      ? Color.fromRGBO(33, 39, 52, 1)
                                      : Color.fromRGBO(229, 237, 245, 1),
                                  color: themeNotifier.isDark
                                      ? Colors.white70
                                      : Color.fromRGBO(33, 39, 52, 1),
                                  icon: Icons.videogame_asset_outlined),
                              CustomNeumpCard(
                                  isFlat: true,
                                  bgColor: themeNotifier.isDark
                                      ? Color.fromRGBO(33, 39, 52, 1)
                                      : Color.fromRGBO(229, 237, 245, 1),
                                  color: themeNotifier.isDark
                                      ? Colors.white70
                                      : Color.fromRGBO(33, 39, 52, 1),
                                  icon: Icons.mouse_outlined)
                            ],
                          ),

                          //PainterCard(),
                        ],
                      ),
                    ),

                    //ListView horizontal scroll
                    Container(
                        //color: Colors.red,
                        padding: EdgeInsets.only(top: 30),
                        height: (MediaQuery.of(context).size.width * .55) + 110,
                        width: MediaQuery.of(context).size.width,
                        child: _buildCarousel(context, 0)),
                  ],
                ),
              ),
              //____End of main content

              ///____Floating custom bottomnav
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ActiveBottomnavButton(
                              icon: MdiIcons.homeOutline, title: "Home"),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(MdiIcons.account,
                                  color: themeNotifier.isDark
                                      ? Colors.white60
                                      : Colors.black54,
                                  size: 28)),
                          IconButton(
                              onPressed: () {
                                _settingModalBottomSheet(
                                    context, themeNotifier);
                              },
                              icon: Icon(MdiIcons.cog,
                                  color: themeNotifier.isDark
                                      ? Colors.white60
                                      : Colors.black54,
                                  size: 28)),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(MdiIcons.bookmark,
                                  color: themeNotifier.isDark
                                      ? Colors.white60
                                      : Colors.black54,
                                  size: 28)),
                        ],
                      ))),

              ///____End of floating custom bottomnav
            ],
          ),
        ),
      );
    });
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return SizedBox(
        // you may want to use an aspect ratio here for tablet support
        //  height: (MediaQuery.of(context).size.width * .62) + 400,
        width: MediaQuery.of(context).size.width * .7,
        child: PageView.builder(
          itemCount: Home.listItems.length,
          onPageChanged: (page) {
            setState(() {
              currentPos = page;
            });
          },

          // store this controller in a State to save the carousel scroll position
          controller: cntrl,
          itemBuilder: (BuildContext context, int itemIndex) {
            return _buildCarouselItem(context, carouselIndex, itemIndex);
          },
        ));
  }

  Widget _buildCarouselItem(
      BuildContext context, int carouselIndex, int itemIndex) {
    return Opacity(
      opacity: currentPos == itemIndex ? 1 : .7,
      child: Transform.scale(
        scale: currentPos == itemIndex ? 1.12 : 1,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 0),
          height: (MediaQuery.of(context).size.width * .55) + 110,
          child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => About()),
                );
              },
              child: PainterCard(
                item: Home.listItems[itemIndex],
                index: itemIndex,
              )),
        ),
      ),
    );
  }
}

///Modal to switch dark theme
void _settingModalBottomSheet(context, themeNotifier) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Wrap(
          children: <Widget>[
            ListTile(
              title:
                  Text(themeNotifier.isDark ? "Dark Theme" : "Light Theme",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Neumorphic(
                style: NeumorphicStyle(
                  shape: NeumorphicShape.convex,
                  depth: 2,
                  intensity: .4,
                  lightSource: LightSource.topLeft,
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                  border: NeumorphicBorder(width: 1, color: Colors.black26)
                ),
                child: SwitcherButton(
                  value: themeNotifier.isDark ? false : true,
                  onChange: (value) {
                    themeNotifier.isDark
                        ? themeNotifier.isDark = false
                        : themeNotifier.isDark = true;
                  },
                ),
              ),
            )
          ],
        );
      });
}

/// end of modal

class ListItem {
  final String title, subtitle, image;

  const ListItem(
      {required this.title, required this.subtitle, required this.image});
}
