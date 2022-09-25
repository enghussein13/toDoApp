import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project2/shared/styles/colors.dart';
class Themes{


static ThemeData lightTheme= ThemeData(
textTheme: const TextTheme(
bodyText1: TextStyle(
color: Colors.black,
fontSize: 18.0,
fontWeight: FontWeight.w600
)
),
fontFamily: 'jannah',
primarySwatch:defaultColor,
scaffoldBackgroundColor: Colors.white,
appBarTheme: const AppBarTheme(
color: Colors.white,
elevation: 0.0,
systemOverlayStyle: SystemUiOverlayStyle(
statusBarColor: Colors.white,
statusBarIconBrightness: Brightness.dark
),
titleTextStyle: TextStyle(
color: Colors.black,
fontSize: 20.0,
fontWeight: FontWeight.bold

),
iconTheme: IconThemeData(
color: Colors.black
)
),
floatingActionButtonTheme: const FloatingActionButtonThemeData(
backgroundColor: Colors.deepOrange
),
bottomNavigationBarTheme: const BottomNavigationBarThemeData(
type: BottomNavigationBarType.fixed,
selectedItemColor: Colors.deepOrange,
)

);

static ThemeData customDarkThemeGetx=ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.deepPurple
    ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.deepPurple,
    unselectedItemColor: Colors.grey
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.deepPurple,

  )
);

  static ThemeData customLightThemeGetx=ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepPurple
    ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.deepPurple,
      )
  );

}