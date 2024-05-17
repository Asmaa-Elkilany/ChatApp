

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTheme {
  static final MyTheme instance = MyTheme();
  ThemeData light = ThemeData.light(useMaterial3: true).copyWith(
    appBarTheme: const AppBarTheme(
      color: Colors.purple,
      foregroundColor: Colors.white,
      shadowColor: Colors.deepPurple,

      iconTheme: IconThemeData(color: Colors.white),
      actionsIconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
      titleSpacing: 20,
      toolbarHeight: 70,
      toolbarTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white
      ),
      titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white
      ),
    //  systemOverlayStyle: SystemUiOverlayStyle.light, // This makes the system bar icons light
    ),
    iconTheme:  IconThemeData(
      color:  Colors.purple.withOpacity(0.9),
    ),
    dividerTheme: DividerThemeData(
        color: Colors.purple.withOpacity(0.7),
        thickness: 1,
    ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.purple.withOpacity(.8),
        elevation: 5,
        selectedIconTheme: const IconThemeData(
          color: Colors.purple,
          opacity: 0.8
        ),
        unselectedIconTheme: const IconThemeData(
          color: Colors.purple,
          opacity: 0.5,
        ),
      ),
    buttonTheme: const ButtonThemeData(
     colorScheme: ColorScheme.light(
       background: Colors.purple
     )
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight:FontWeight.bold,
      )
    )

  );
  ThemeData dark = ThemeData.dark(useMaterial3: true).copyWith(
      appBarTheme:  AppBarTheme(
        color: Colors.deepPurple.shade900,
        foregroundColor: Colors.white,
        shadowColor: Colors.deepPurple.shade800,

        iconTheme: const IconThemeData(color: Colors.white),
        actionsIconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        titleSpacing: 20,
        toolbarHeight: 70,
        toolbarTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),
        titleTextStyle: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),
        //  systemOverlayStyle: SystemUiOverlayStyle.light, // This makes the system bar icons light
      ),
      iconTheme:  IconThemeData(
        color:  Colors.deepPurple.shade900.withOpacity(0.9),
      ),
      dividerTheme: DividerThemeData(
        color: Colors.deepPurple.shade900.withOpacity(0.7),
        thickness: 1,
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.deepPurple.shade900.withOpacity(.8),
        elevation: 5,
        selectedIconTheme:  IconThemeData(
            color: Colors.deepPurple.shade900,
            opacity: 0.8
        ),
        unselectedIconTheme:  IconThemeData(
          color: Colors.deepPurple.shade900,
          opacity: 0.5,
        ),
      ),
      buttonTheme:  ButtonThemeData(
          colorScheme: ColorScheme.dark(
              background: Colors.deepPurple.shade900
          )
      ),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight:FontWeight.bold,
          )
      )

  );



}



