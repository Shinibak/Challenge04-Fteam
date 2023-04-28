import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CheckBoxDesktopWidget extends StatelessWidget {
  final bool wasCheck;
  final double screenSize;

  const CheckBoxDesktopWidget({
    super.key,
    required this.wasCheck,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    final theme = Theme.of(context).extension<ThemeCustom>()!;

    return Container(
      height: screenSize * 0.025390625,
      width: screenSize * 0.025390625,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenSize * 0.0078125),
        color: wasCheck ? theme.buttonColorOn : theme.todoColorOff,
        border: Border.all(
          color: theme.buttonColorOn!,
          width: screenSize * 0.001953125,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.check,
          color: wasCheck ? theme.todoColorOn : theme.buttonColorOff,
          size: screenSize * 0.01171875,
        ),
      ),
    );
  }
}
