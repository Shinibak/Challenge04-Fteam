import 'package:challenge04_fteam/src/controllers/animated_chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'profile_box_widget.dart';

class OpenProfileWidget extends StatelessWidget {
  final double screenSize;
  OpenProfileWidget({
    super.key,
    required this.screenSize,
  });

  late AnimatedChatController controller;

  @override
  Widget build(BuildContext context) {
    controller = context.watch<AnimatedChatController>();

    return ValueListenableBuilder(
      valueListenable: controller.openProfile,
      builder: (context, isOpen, child) => AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        width: isOpen ? screenSize * 0.234375 : 0,
        child: ProfileBoxDesktopWidget(
          screenSize: screenSize,
          profile: controller.getProfile(),
        ),
      ),
    );
  }
}
