import 'package:flutter/material.dart';
import '../themes/theme_extensions.dart';

class ProfileButtonsWidget extends StatelessWidget {
  final IconData icon;
  final bool active;
  final double buttonSize;
  final double iconSize;
  final double borderRadius;
  const ProfileButtonsWidget({
    super.key,
    required this.icon,
    required this.active,
    required this.buttonSize,
    required this.iconSize, required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeCustom>()!;

    return Container(
      height: buttonSize,
      width: buttonSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: theme.profileButton,
      ),
      child: Center(
        child: Icon(
          icon,
          color: active
              ? Theme.of(context).iconTheme.color
              : theme.buttonIconColorOff,
          size: iconSize,
        ),
      ),
    );
  }
}
