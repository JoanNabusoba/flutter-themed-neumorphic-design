// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:game/utils/ThemeModal.dart';
import 'package:provider/provider.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModal(),
      child: Consumer(builder: (context, ThemeModal themeModal, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: themeModal.isDark
              ? ThemeData.dark().copyWith(
                  //backgroundColor: Color.fromRGBO(33, 39, 52, 1),
                  scaffoldBackgroundColor: Color.fromRGBO(33, 39, 52, 1),
                  textTheme: Theme.of(context).textTheme.apply(
                        bodyColor: Colors.white70,
                        displayColor: Colors.white,
                      ))
              : ThemeData.light().copyWith(
                  scaffoldBackgroundColor: Color.fromRGBO(226, 236, 244, 1),
                  textTheme: Theme.of(context).textTheme.apply(
                        bodyColor: Colors.black87,
                        displayColor: Colors.black,
                      )),
          home: const Home(),
        );
      }),
    );
  }
}
