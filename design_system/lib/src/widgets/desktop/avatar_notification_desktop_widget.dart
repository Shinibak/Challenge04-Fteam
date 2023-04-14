import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AvatarNotificationDesktopWidget extends StatelessWidget {
  final String avatarImage;
  final int notifications;
  final bool active;

  final double screenSize;
  const AvatarNotificationDesktopWidget({
    super.key,
    required this.avatarImage,
    required this.notifications,
    required this.active,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: screenSize * 0.044921875,
          width: screenSize * 0.044921875,
        ),
        Positioned(
          left: 0,
          top: 0,
          child: AvatarDesktopWidget(
            avatarImage: avatarImage,
            screenSize: screenSize,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: NotificationDesktopWidget(
            notification: notifications,
            activeNotification: active,
            screenSize: screenSize,
          ),
        ),
      ],
    );
  }
}
