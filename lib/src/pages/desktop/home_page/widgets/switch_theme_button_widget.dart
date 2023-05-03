import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class SwitchThemeButtonWidget extends StatelessWidget {
  final double screenSize;
  const SwitchThemeButtonWidget({super.key, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeCustom>()!;
    return Container(
      height: screenSize * 0.033203125,
      width: screenSize * 0.0546875,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenSize * 0.017578125),
        border: Border.all(
          color: theme.notificationColorOn!,
          width: screenSize * 0.001953125,
        ),
      ),
    );
  }
}
