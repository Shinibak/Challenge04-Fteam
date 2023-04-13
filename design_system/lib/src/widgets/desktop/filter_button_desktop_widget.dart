import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class FilterButtonDesktopWidget extends StatefulWidget {
  final String text;
  final IconData icon;
  final int notifications;
  final bool active;
  final double screenSize;

  const FilterButtonDesktopWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.notifications,
    required this.active,
    required this.screenSize,
  });

  @override
  State<FilterButtonDesktopWidget> createState() =>
      _FilterButtonDesktopWidgetState();
}

class _FilterButtonDesktopWidgetState extends State<FilterButtonDesktopWidget> {
  late bool wasPressed = widget.active;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeCustom>()!;

    return Container(
      height: widget.screenSize * 0.0625,
      width: widget.screenSize * 0.181640625,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.screenSize * 0.017578125),
        color: wasPressed ? theme.buttonColorOn : theme.buttonColorOff,
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            wasPressed = !wasPressed;
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: widget.screenSize * 0.01953125),
            Icon(
              widget.icon,
              size: widget.screenSize * 0.0234375,
              color: wasPressed
                  ? theme.buttonIconColorOn
                  : theme.notificationColorOff,
            ),
            SizedBox(width: widget.screenSize * 0.013671875),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.text,
                  style: wasPressed
                      ? theme.buttonTextOnStyle
                      : theme.buttonTestOffStyle,
                ),
                Text(
                  '${widget.notifications}',
                  style: wasPressed
                      ? theme.buttonTextOnStyle
                      : theme.buttonTestOffStyle,
                ),
              ],
            ),
            SizedBox(width: widget.screenSize * 0.01953125),
          ],
        ),
      ),
    );
  }
}
