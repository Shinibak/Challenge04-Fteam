import 'package:flutter/material.dart';
import '../themes/theme_extensions.dart';

class NotificationWidget extends StatelessWidget {
  final int notification;
  final bool activeNotification;
  final double screenSize;
  const NotificationWidget({
    super.key,
    required this.notification,
    required this.activeNotification,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeCustom>()!;
    final textStyle = Theme.of(context).textTheme;
    return Container(
      height: screenSize * 0.053,
      width: screenSize * 0.053,
      decoration: BoxDecoration(
        color: activeNotification
            ? theme.notificationColorOn
            : theme.notificationColorOff,
        borderRadius: BorderRadius.circular(screenSize * 0.026),
      ),
      child: Center(
        child: Text(
          notification.toString(),
          style: textStyle.overline,
        ),
      ),
    );
  }
}
