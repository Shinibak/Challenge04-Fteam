import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'pages/mobile/chat_page.dart';
import 'pages/home_page.dart';
import 'pages/mobile/profile_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenge 4 F-Team',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/two': (context) => const ChatPage(),
        '/tree': (context) => const ProfilePage(),
      },
    );
  }
}
