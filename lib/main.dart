// ignore_for_file: prefer_const_constructors

import 'package:database_integration/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Controller c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // themeMode: c.isDarkMode.value == true ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        canvasColor: Color(0xFFFFFFFF),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xFF9A6AFF)),
        )),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Color(0xff1E2029)),
        ),
        appBarTheme: AppBarTheme(
          color: Color(0xFF9A6AFF),
          elevation: 0.0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF9A6AFF))),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF9A6AFF))),
          fillColor: Color(0xffE3E3E3),
          focusColor: Color(0xffE3E3E3),
          hoverColor: Color(0xffE3E3E3),
          prefixIconColor: Color(0xFF9A6AFF),
          labelStyle: TextStyle(color: Color(0xFF9A6AFF)),
          hintStyle: TextStyle(color: Color.fromARGB(255, 185, 185, 185)),
        ),
      ),
      darkTheme: ThemeData(
        cardColor: Color(0xFF151515),
        canvasColor: Color(0xFF1E2029),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xFF9A6AFF)),
        )),
        textTheme: TextTheme(
          bodySmall: TextStyle(color: Color(0xffE3E3E3)),
          bodyMedium: TextStyle(color: Color(0xffE3E3E3)),
          bodyLarge: TextStyle(color: Color(0xffE3E3E3)),
          titleSmall: TextStyle(color: Color(0xffE3E3E3)),
          titleMedium: TextStyle(color: Color(0xffE3E3E3)),
          titleLarge: TextStyle(color: Color(0xffE3E3E3)),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF9A6AFF))),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF9A6AFF))),
          fillColor: Color(0xffE3E3E3),
          focusColor: Color(0xffE3E3E3),
          hoverColor: Color(0xffE3E3E3),
          prefixIconColor: Color(0xFF9A6AFF),
          labelStyle: TextStyle(color: Color(0xFF9A6AFF)),
          hintStyle: TextStyle(color: Color(0xffE3E3E3)),
        ),
        appBarTheme: AppBarTheme(
          color: Color(0xFF1E2029),
          elevation: 0.0,
        ),
      ),
      title: 'Database Integration',
      home: HomePage(),
    );
  }
}


//  ffffff 9A6AFF 1E2029 E3E3E3