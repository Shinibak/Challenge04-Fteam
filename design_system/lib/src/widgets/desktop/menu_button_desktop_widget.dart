import 'package:flutter/material.dart';
import '../../themes/theme_extensions.dart';

class MenuButtonDesktopWidget extends StatefulWidget {
  final IconData icon;
  final String title;
  final bool active;
  final double screenSize;
  const MenuButtonDesktopWidget({
    super.key,
    required this.icon,
    required this.active,
    required this.screenSize,
    required this.title,
  });

  @override
  State<MenuButtonDesktopWidget> createState() =>
      _MenuButtonDesktopWidgetState();
}

class _MenuButtonDesktopWidgetState extends State<MenuButtonDesktopWidget> {
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
        height: widget.screenSize * 0.101,
        decoration: BoxDecoration(
          color: theme.offColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: widget.screenSize * 0.0078,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(widget.screenSize * 0.0039),
                ),
                color: wasPressed ? theme.buttonColorOn : theme.buttonColorOff,
              ),
            ),
            SizedBox(height: widget.screenSize * 0.03125),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: widget.screenSize * 0.01953125),
                Icon(
                  widget.icon,
                  color: wasPressed
                      ? theme.buttonIconColorOn
                      : theme.buttonIconColorOff,
                  size: widget.screenSize * 0.0234375,
                ),
                SizedBox(width: widget.screenSize * 0.013671875),
                Text(widget.title),
                SizedBox(width: widget.screenSize * 0.01953125),
              ],
            ),
            SizedBox(height: widget.screenSize * 0.0390625),
          ],
        ),
      ),
    );
  }
}
