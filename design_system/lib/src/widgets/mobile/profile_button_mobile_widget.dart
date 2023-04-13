import 'package:flutter/material.dart';
import '../../themes/theme_extensions.dart';

class ProfileButtonsMobileWidget extends StatelessWidget {
  final IconData icon;
  final bool active;
  final double screenSize;
  const ProfileButtonsMobileWidget({
    super.key,
    required this.icon,
    required this.active,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeCustom>()!;

     return Container(
      height: screenSize * 0.16,
      width: screenSize * 0.16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenSize * 0.04),
        color: theme.profileButton,
      ),
      child: Center(
        child: Icon(
          icon,
          color: active
              ? Theme.of(context).iconTheme.color
              : theme.buttonIconColorOff,
          size: screenSize * 0.058,
        ),
      ),
    );
  }
}
