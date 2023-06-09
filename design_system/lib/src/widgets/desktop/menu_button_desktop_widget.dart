import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

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
      child: SizedBox(
        height: widget.screenSize * 0.101,
        child: Column(
          children: [
            Container(
              height: widget.screenSize * 0.0078,
              width: widget.screenSize * 0.119140625,
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
                      ? theme.buttonColorOn
                      : theme.buttonIconColorOff,
                  size: widget.screenSize * 0.0234375,
                ),
                SizedBox(width: widget.screenSize * 0.013671875),
                Text(
                  widget.title,
                  style: wasPressed
                      ? theme.buttonMenuTextOnStyle
                      : theme.buttonMenuTextOffStyle,
                ),
                SizedBox(width: widget.screenSize * 0.01953125),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
