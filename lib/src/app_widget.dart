import 'package:challenge04_fteam/src/pages/home_page.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/chat_controller.dart';
import 'pages/mobile/chat_page.dart';
import 'pages/mobile/profile_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ChatController(),
        ),
      ],
      child: MaterialApp(
        title: 'Challenge 4 F-Team',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: lightTheme,
        darkTheme: darkTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/two': (context) => ChatPage(),
          '/tree': (context) => const ProfilePage(),
        },
      ),
    );
  }
}
