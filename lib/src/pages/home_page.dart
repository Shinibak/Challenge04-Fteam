import 'package:challenge04_fteam/src/pages/mobile/mobile_home_page.dart';
import 'package:challenge04_fteam/src/pages/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'desktop/desktop_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobile: MobileHomePage(),
        desktop: DesktopHomePage(),
      ),
    );
  }
}
