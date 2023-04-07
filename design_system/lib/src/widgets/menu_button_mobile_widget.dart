import 'package:flutter/material.dart';
import '../themes/theme_extensions.dart';

class MenuButtonMobileWidget extends StatefulWidget {
  final IconData icon;
  final bool active;
  final double screenSize;
  const MenuButtonMobileWidget({
    super.key,
    required this.icon,
    required this.active,
    required this.screenSize,
  });

  @override
  State<MenuButtonMobileWidget> createState() => _MenuButtonMobileWidgetState();
}

class _MenuButtonMobileWidgetState extends State<MenuButtonMobileWidget> {
  late bool wasPressed = widget.active;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeCustom>()!;

    return GestureDetector(
      onTap: () {
        setState(
          () {
            wasPressed = !wasPressed;
          },
        );
      },
      child: Container(
        height: widget.screenSize * 0.133,
        width: widget.screenSize * 0.133,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.screenSize * 0.04),
          color: wasPressed ? theme.buttonColorOn : theme.buttonColorOff,
        ),
        child: Center(
          child: Icon(
            widget.icon,
            color:
                wasPressed ? theme.buttonIconColorOn : theme.buttonIconColorOff,
            size: widget.screenSize * 0.058,
          ),
        ),
      ),
    );
  }
}
