import 'package:flutter/material.dart';
import 'theme_extensions.dart';

ThemeData get lightTheme => ThemeData(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: const Color.fromARGB(255, 143, 173, 243),
      iconTheme: const IconThemeData(color: Colors.black),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromARGB(255, 99, 143, 219),
      ),
      textTheme: const TextTheme(
        headline5: TextStyle(fontSize: 18, color: Colors.black),
        headline6: TextStyle(fontSize: 10, color: Colors.black),
        bodyText1: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        bodyText2: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        subtitle1: TextStyle(fontSize: 16, color: Colors.black),
        subtitle2: TextStyle(fontSize: 14, color: Colors.black),
        caption: TextStyle(fontSize: 12, color: Colors.black),
        overline: TextStyle(fontSize: 10, color: Colors.black),
      ),
      extensions: <ThemeExtension<dynamic>>[
        ThemeCustom(
          buttonColorOn: const Color.fromARGB(255, 79, 223, 170),
          buttonColorOff: Colors.transparent,
          notificationColorOn: const Color.fromARGB(255, 75, 169, 245),
          notificationColorOff: Colors.black,
          buttonIconColorOn: Colors.white,
          buttonIconColorOff: Colors.black,
          mutedIcon: const Color.fromARGB(255, 79, 223, 170),
          todoColorOn: Colors.blueAccent,
          profileButton: const Color.fromARGB(255, 133, 204, 255),
          profileCardTheme: const Color.fromARGB(255, 127, 189, 255),
          onlineColor: const Color(0xffa4d43c),
          offColor: Colors.transparent,
          sendMsg: const Color.fromARGB(255, 222, 200, 250),
          receivedMsg: const Color.fromARGB(255, 88, 196, 162),
          backOpacity: Colors.blue.withOpacity(0.7),
          back: Colors.blue.withOpacity(0.7),
          deleted: Color.fromARGB(255, 226, 237, 132),
          todoColorOff: const Color.fromARGB(255, 104, 174, 231),
          lateStyle: const TextStyle(
            fontSize: 10,
            color: Color.fromARGB(255, 226, 237, 132),
          ),
          buttonError: const TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 226, 237, 132),
          ),
          buttonTextOnStyle: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
          buttonTextOffStyle:
              const TextStyle(fontSize: 14, color: Colors.black),
          buttonMenuTextOnStyle: const TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 79, 223, 170),
          ),
          buttonMenuTextOffStyle:
              const TextStyle(fontSize: 14, color: Colors.black),
          chatColor: const Color.fromARGB(255, 142, 165, 255),
        ),
      ],
    );
