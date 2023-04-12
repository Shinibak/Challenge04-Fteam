import 'package:flutter/material.dart';
import '../../../design_system.dart';

class CheckBoxMobileWidget extends StatelessWidget {
  final bool wasCheck;
  final double screenSize;

  const CheckBoxMobileWidget({
    super.key,
    required this.wasCheck,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    final theme = Theme.of(context).extension<ThemeCustom>()!;

    return Container(
      height: screenSize * 0.106,
      width: screenSize * 0.106,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenSize * 0.026),
        color: wasCheck ? theme.buttonColorOn : theme.todoColorOff,
        border: Border.all(
          color: theme.buttonColorOn!,
          width: screenSize * 0.005,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.check,
          color: wasCheck ? theme.todoColorOn : theme.buttonColorOff,
          size: screenSize * 0.042,
        ),
      ),
    );
  }
}
