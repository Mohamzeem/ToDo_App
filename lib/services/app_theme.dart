import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemes {
  darkTheme() => ThemeData(
        fontFamily: 'MouseMemoirs',
        appBarTheme: const AppBarTheme(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
          elevation: 0,
          centerTitle: true,
        ),
        primarySwatch: Colors.grey,
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF212121),
        dividerColor: Colors.black54,
        iconTheme: const IconThemeData(color: Colors.white),
        textButtonTheme: const TextButtonThemeData(
            style: ButtonStyle(
                iconColor: MaterialStatePropertyAll(Colors.white),
                iconSize: MaterialStatePropertyAll(20))),
        switchTheme: const SwitchThemeData(
            thumbColor: MaterialStatePropertyAll(Colors.black),
            trackColor: MaterialStatePropertyAll(Colors.white)),
        checkboxTheme: const CheckboxThemeData(
            checkColor: MaterialStatePropertyAll(Colors.black),
            fillColor: MaterialStatePropertyAll(Colors.white)),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.white, foregroundColor: Colors.black),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
          titleMedium: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
          titleSmall: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
          displayLarge: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          displayMedium: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline),
          displaySmall: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.grey, unselectedItemColor: Colors.white),
      );

  lightTheme() => ThemeData(
        fontFamily: 'MouseMemoirs',
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
        ),
        primarySwatch: Colors.grey,
        primaryColor: Colors.white,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        dividerColor: const Color(0xff757575),
        iconTheme: const IconThemeData(color: Colors.black),
        textButtonTheme: const TextButtonThemeData(
            style: ButtonStyle(
                iconColor: MaterialStatePropertyAll(Colors.black),
                iconSize: MaterialStatePropertyAll(20))),
        switchTheme: const SwitchThemeData(
            thumbColor: MaterialStatePropertyAll(Colors.white),
            trackColor: MaterialStatePropertyAll(Colors.black)),
        checkboxTheme: const CheckboxThemeData(
            checkColor: MaterialStatePropertyAll(Colors.white),
            fillColor: MaterialStatePropertyAll(Colors.black)),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.black, foregroundColor: Colors.white),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.w500),
          titleMedium: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w300),
          titleSmall: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
          displayLarge: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
          displayMedium: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline),
          displaySmall: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w300),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.grey,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white),
      );
}
