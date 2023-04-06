import 'package:flutter/material.dart';
import '../themes/theme_extensions.dart';

class OnlineStatusWidget extends StatelessWidget {
  final double screenSize;
  final bool isOnline;
  const OnlineStatusWidget({
    super.key,
    required this.isOnline,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeCustom>()!;

    return Container(
      height: screenSize * 0.026,
      width: screenSize * 0.026,
      decoration: BoxDecoration(
        color: isOnline ? theme.onlineColor : theme.offlineColor,
        borderRadius: BorderRadius.circular(screenSize * 0.021),
      ),
    );
  }
}
