import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ProfileButtonsDesktopWidget extends StatelessWidget {
  final IconData icon;
  final bool active;
  final double screenSize;
  const ProfileButtonsDesktopWidget({
    super.key,
    required this.icon,
    required this.active,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeCustom>()!;

     return Container(
      height: screenSize *0.0390625,
      width: screenSize * 0.0390625,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenSize * 0.01171875),
        color: theme.profileButton,
      ),
      child: Center(
        child: Icon(
          icon,
          color: active
              ? Theme.of(context).iconTheme.color
              : theme.buttonIconColorOff,
          size: screenSize * 0.021484375,
        ),
      ),
    );
  }
}
