import 'package:flutter/material.dart';
import '../themes/theme_extensions.dart';

class MenuButtonWidget extends StatefulWidget {
  final IconData icon;
  final bool active;
  final double screenSize;
  const MenuButtonWidget({
    super.key,
    required this.icon,
    required this.active,
    required this.screenSize,
  });

  @override
  State<MenuButtonWidget> createState() => _MenuButtonWidgetState();
}

class _MenuButtonWidgetState extends State<MenuButtonWidget> {
  late bool wasPressed = widget.active;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeCustom>()!;

    return Container(
      height: widget.screenSize * 0.133,
      width: widget.screenSize * 0.133,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.screenSize * 0.04),
        color: wasPressed ? theme.buttonColorOn : theme.buttonColorOff,
      ),
      child: GestureDetector(
        onTap: () {
          setState(
            () {
              wasPressed = !wasPressed;
            },
          );
        },
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
