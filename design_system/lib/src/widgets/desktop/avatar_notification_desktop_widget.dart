
import 'package:flutter/material.dart';

import 'notification_descktop_widget.dart';

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
          height: screenSize * 0.117,
          width: screenSize * 0.117,
        ),
        Positioned(
          left: 0,
          top: 0,
          child: SizedBox(
            height: screenSize * 0.106,
            width: screenSize * 0.106,
            child: CircleAvatar(
              backgroundImage: AssetImage(avatarImage),
              radius: screenSize * 0.053,
            ),
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
