import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const kPrimaryColor = Color(0xff016D48);
const kBorderRadius = 15.0;
const borderRadius = 15.0;
InputDecorationTheme _buildInputDecorationTheme(Color fillColor) {
  return InputDecorationTheme(
    filled: true,
    fillColor: fillColor,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(8.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(8.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(8.0),
    ),
  );
}

const kPageTransitionsTheme = PageTransitionsTheme(
  builders: {
    TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  },
);

ButtonStyle _buildElevatedButtonStyle() {
  return ButtonStyle(
    backgroundColor: WidgetStateProperty.all(kPrimaryColor),
    foregroundColor: WidgetStateProperty.all(Colors.white),
    elevation: WidgetStateProperty.all(8),
    shadowColor: WidgetStateProperty.all(Colors.black.withOpacity(0.4)),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
    side: WidgetStateProperty.all(
      BorderSide(color: Colors.white.withOpacity(0.2), width: 1.5),
    ),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    ),
    overlayColor: WidgetStateProperty.all(Colors.white.withOpacity(0.1)),
  );
}

Color buildCardColor = Color(0xffFFFFFF);

ThemeData lightTheme() => ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: kPrimaryColor,
    brightness: Brightness.light,
  ),
  brightness: Brightness.light,
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: const Color(0xffF5F5F5),

  canvasColor: const Color(0xffFFFFFF),

  cardColor: Colors.white70,
  drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color(0xfff0efe7),
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Color(0xfff0efe7),
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
  ),
  tabBarTheme: const TabBarThemeData(
    labelColor: Colors.black,
    unselectedLabelColor: Colors.grey,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: kPrimaryColor,
    unselectedItemColor: Colors.grey,
  ),
  radioTheme: RadioThemeData(fillColor: WidgetStateProperty.all(kPrimaryColor)),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: _buildElevatedButtonStyle(),
  ),
  pageTransitionsTheme: kPageTransitionsTheme,
  inputDecorationTheme: _buildInputDecorationTheme(const Color(0xffF6F2E5)),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(kPrimaryColor), // text color
      backgroundColor: WidgetStateProperty.all(Colors.transparent),
      textStyle: WidgetStateProperty.all(
        TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
  ),
);

ThemeData darkTheme() => ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: kPrimaryColor,
    brightness: Brightness.dark,
  ),
  brightness: Brightness.dark,
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: const Color(0xff050505),
  canvasColor: const Color(0xff242426),
  cardColor: const Color(0xff181A21),
  drawerTheme: const DrawerThemeData(backgroundColor: Color(0xff171d29)),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color(0xff1B1B1B),
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: Color(0xff1B1B1B),

    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  ),
  tabBarTheme: const TabBarThemeData(
    labelColor: Colors.white,
    unselectedLabelColor: Colors.grey,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: kPrimaryColor,
    unselectedItemColor: Colors.grey,
  ),
  radioTheme: RadioThemeData(fillColor: WidgetStateProperty.all(kPrimaryColor)),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: _buildElevatedButtonStyle(),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(Colors.white),
      backgroundColor: WidgetStateProperty.all(Colors.transparent),
      textStyle: WidgetStateProperty.all(
        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
  ),

  pageTransitionsTheme: kPageTransitionsTheme,
  inputDecorationTheme: _buildInputDecorationTheme(const Color(0xff242426)),
);
