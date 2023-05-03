import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'controllers/chat_controller.dart';
import 'controllers/theme_controller.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  ThemeController themeController = ThemeController();

  @override
  void initState() {
    super.initState();
    themeController.addListener(themeListener);
  }

  @override
  void dispose() {
    super.dispose();
    themeController.removeListener(themeListener);
  }

  void themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/home/');

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ChatController(),
        ),
        ChangeNotifierProvider(
          create: (context) => themeController,
        ),
      ],
      child: MaterialApp.router(
        title: 'Challenge 4 F-Team',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeController.themeMode,
        routerDelegate: Modular.routerDelegate,
        routeInformationParser: Modular.routeInformationParser,
      ),
    );
  }
}
