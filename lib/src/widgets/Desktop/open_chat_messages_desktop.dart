import 'package:challenge04_fteam/src/controllers/animated_chat_controller.dart';
import 'package:challenge04_fteam/src/widgets/Desktop/app_bar_chat_desktop_widget.dart';
import 'package:challenge04_fteam/src/widgets/Desktop/chat_messages_desktop_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'open_profile_desktop_widget.dart';

class OpenChatMessageWidget extends StatelessWidget {
  final double screenSize;
  OpenChatMessageWidget({
    super.key,
    required this.screenSize,
  });

  late AnimatedChatController controller;

  @override
  Widget build(BuildContext context) {
    controller = context.watch<AnimatedChatController>();
    final theme = Theme.of(context).extension<ThemeCustom>()!;
    return ValueListenableBuilder(
      valueListenable: controller.openChat,
      builder: (context, isOpen, child) => AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        width: isOpen ? screenSize * 0.82421875 : 0,
        child: Row(
          children: [
            Container(
              width: screenSize * 0.5703125,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(screenSize * 0.01953125),
                ),
                color: theme.todoColorOff,
              ),
              child: Stack(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        AppBarChatDesktopWidget(
                          profile: controller.getProfile(),
                          screenSize: screenSize,
                        ),
                        ChatMessagesDesktopWidget(
                          profile: controller.getProfile(),
                          screenSize: screenSize,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: screenSize * 0.015625),
                      child: TextBarDesktopWidget(
                        screenSize: screenSize,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: screenSize * 0.01953125),
            OpenProfileWidget(screenSize: screenSize),
          ],
        ),
      ),
    );
  }
}
