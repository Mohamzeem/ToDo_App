import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemes {
  darkTheme() => ThemeData(
        fontFamily: 'Cairo',
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
        iconTheme: const IconThemeData(color: Colors.redAccent),
        listTileTheme: const ListTileThemeData(iconColor: Colors.redAccent),
        popupMenuTheme: const PopupMenuThemeData(
            shadowColor: Colors.redAccent, elevation: 5),
        textButtonTheme: const TextButtonThemeData(
            style: ButtonStyle(
                iconColor: MaterialStatePropertyAll(Colors.redAccent),
                iconSize: MaterialStatePropertyAll(20))),
        switchTheme: const SwitchThemeData(
            thumbColor: MaterialStatePropertyAll(Colors.redAccent),
            trackColor: MaterialStatePropertyAll(Colors.white)),
        checkboxTheme: const CheckboxThemeData(
            checkColor: MaterialStatePropertyAll(Colors.white),
            fillColor: MaterialStatePropertyAll(Colors.redAccent)),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.white, foregroundColor: Colors.redAccent),
        textTheme: TextTheme(
          titleLarge: TextStyle(
              color: Colors.white,
              fontSize: 25.sp,
              fontWeight: FontWeight.w500),
          titleMedium: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w300),
          titleSmall: TextStyle(
              color: Colors.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400),
          displayLarge: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500),
          displayMedium: TextStyle(
              color: Colors.redAccent,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline),
          displaySmall: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w300),
          bodyMedium: TextStyle(
              color: Colors.redAccent,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400),
          bodyLarge: TextStyle(
              color: Colors.redAccent,
              fontSize: 25.sp,
              fontWeight: FontWeight.w600),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Colors.redAccent,
            backgroundColor: Colors.grey,
            unselectedItemColor: Colors.black),
      );

  lightTheme() => ThemeData(
        fontFamily: 'Cairo',
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
        ),
        primarySwatch: Colors.grey,
        primaryColor: Colors.white,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        dividerColor: const Color(0xff757575),
        iconTheme: const IconThemeData(color: Colors.greenAccent),
        listTileTheme: const ListTileThemeData(iconColor: Colors.greenAccent),
        popupMenuTheme: const PopupMenuThemeData(
            shadowColor: Colors.greenAccent, elevation: 5),
        textButtonTheme: const TextButtonThemeData(
            style: ButtonStyle(
                iconColor: MaterialStatePropertyAll(Colors.greenAccent),
                iconSize: MaterialStatePropertyAll(20))),
        switchTheme: const SwitchThemeData(
            thumbColor: MaterialStatePropertyAll(Colors.greenAccent),
            trackColor: MaterialStatePropertyAll(Colors.black)),
        checkboxTheme: const CheckboxThemeData(
            checkColor: MaterialStatePropertyAll(Colors.black),
            fillColor: MaterialStatePropertyAll(Colors.greenAccent)),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.black, foregroundColor: Colors.greenAccent),
        textTheme: TextTheme(
          titleLarge: TextStyle(
              color: Colors.black,
              fontSize: 25.sp,
              fontWeight: FontWeight.w500),
          titleMedium: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w300),
          titleSmall: TextStyle(
              color: Colors.black,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400),
          displayLarge: TextStyle(
              color: Colors.black,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500),
          displayMedium: TextStyle(
              color: Colors.greenAccent,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline),
          displaySmall: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w300),
          bodyMedium: TextStyle(
              color: Colors.greenAccent,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400),
          bodyLarge: TextStyle(
              color: Colors.greenAccent,
              fontSize: 22.sp,
              fontWeight: FontWeight.w600),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.grey,
            selectedItemColor: Colors.greenAccent,
            unselectedItemColor: Colors.white),
      );
}
