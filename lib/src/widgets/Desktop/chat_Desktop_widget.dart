import 'package:challenge04_fteam/src/models/profile_model.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'app_bar_chat_desktop_widget.dart';
import 'chat_messages_desktop_widget.dart';

class ChatDesktopWidget extends StatelessWidget {
  final ProfileModel profile;
  final double screenSize;
  const ChatDesktopWidget({
    super.key,
    required this.screenSize,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeCustom>()!;

    return Expanded(
      child: Container(
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
                    profile: profile,
                    screenSize: screenSize,
                  ),
                  ChatMessagesDesktopWidget(
                    profile: profile,
                    screenSize: screenSize,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: screenSize * 0.096),
                child: TextBarDesktopWidget(
                  screenSize: screenSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
