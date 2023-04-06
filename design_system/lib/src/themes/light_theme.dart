import 'package:flutter/material.dart';
import 'theme_extensions.dart';

ThemeData get lightTheme => ThemeData(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      textTheme: const TextTheme(
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
          buttonColorOn: Colors.deepOrange,
          buttonColorOff: Colors.transparent,
          notificationColorOn: Colors.blue,
          notificationColorOff: Colors.grey,
          buttonTextOnStyle: const TextStyle(fontSize: 14, color: Colors.white),
          buttonTestOffStyle:
              const TextStyle(fontSize: 14, color: Colors.black),
          buttonIconColorOn: Colors.white,
          buttonIconColorOff: Colors.black,
          mutedIcon: Colors.red,
          todoColorOn: Colors.blueAccent,
          todoColorOff: const Color.fromARGB(255, 9, 111, 194),
          lateStyle: const TextStyle(fontSize: 10, color: Colors.red),
          buttonError: const TextStyle(fontSize: 16, color: Colors.red),
          profileButton: const Color(0xff6963db),
          profileCardTheme: const Color(0xff5d55d0),
          onlineColor: const Color(0xffa4d43c),
          offlineColor: Colors.transparent,
          sendMsg: const Color(0xffb783f2),
          receivedMsg: const Color(0xff15161a),
          backOpacity: Colors.black.withOpacity(0.7),
          back: Colors.black,
          deleted: Colors.red,
        ),
      ],
    );
