import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'pages/chat_page.dart';
import 'pages/profile_page.dart';
import 'pages/view_chat_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenge 3 F-Team',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const ViewChatPage(),
        '/two': (context) => const ChatPage(),
        '/tree': (context) => const ProfilePage(),
      },
    );
  }
}
