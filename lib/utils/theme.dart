import 'package:flutter/material.dart';
import 'package:medical360_oth/utils/constant.dart';

class MyThemeData {
  // this is for dark theme
  static final darkTheme = ThemeData(
    fontFamily: 'Montserrat',
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFF1a1c1e),
    primaryColor: Colors.white,
    secondaryHeaderColor: const Color(0xFF2f3338),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Color(0xffFFFFFF)),
      centerTitle: false,
      backgroundColor: Color(0xFF2f3338),
    ),
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: Color(0xff37474F)),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Color(0xff37474F)),
    iconTheme: const IconThemeData(color: Color(0xffFFFFFF)),
    listTileTheme: const ListTileThemeData(iconColor: Colors.white),
    unselectedWidgetColor: Colors.white,
  );

// this is for light theme
  static final lightTheme = ThemeData(
    fontFamily: ralewayFont,
    brightness: Brightness.light,
    scaffoldBackgroundColor: kmediumTeal,
    primaryColor: Colors.black,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    secondaryHeaderColor: Colors.white,
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Color(0xff222222)),
        centerTitle: false,
        backgroundColor: Colors.white),
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: Color(0xffDEE4E7)),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Color(0xffDEE4E7)),
    iconTheme: const IconThemeData(color: Color(0xff222222)),
    // floatingActionButtonTheme: const FloatingActionButtonThemeData(
    //   backgroundColor: Colors.red,
    // ),
  );
}
