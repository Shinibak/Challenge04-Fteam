import 'package:challenge04_fteam/src/controllers/theme_controller.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwitchThemeButtonWidget extends StatefulWidget {
  final double screenSize;
  const SwitchThemeButtonWidget({super.key, required this.screenSize});

  @override
  State<SwitchThemeButtonWidget> createState() =>
      _SwitchThemeButtonWidgetState();
}

class _SwitchThemeButtonWidgetState extends State<SwitchThemeButtonWidget> {
  late ThemeController themeController;
  late bool wasPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeCustom>()!;
    themeController = context.watch<ThemeController>();
    return Stack(
      children: [
        Positioned(
          child: Container(
            height: widget.screenSize * 0.033203125,
            width: widget.screenSize * 0.0546875,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(widget.screenSize * 0.017578125),
              border: Border.all(
                color: theme.notificationColorOn!,
                width: widget.screenSize * 0.001953125,
              ),
            ),
          ),
        ),
        Positioned(
          child: SizedBox(
            height: widget.screenSize * 0.033203125,
            width: widget.screenSize * 0.0546875,
            child: Align(
              alignment:
                  wasPressed ? Alignment.centerRight : Alignment.centerLeft,
              child: GestureDetector(
                onTap: () => setState(() {
                  wasPressed = !wasPressed;
                  themeController.toggleTheme(wasPressed);
                }),
                child: Container(
                  height: widget.screenSize * 0.033203125,
                  width: widget.screenSize * 0.033203125,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(widget.screenSize * 0.017578125),
                    color: theme.notificationColorOn,
                  ),
                  child: Center(
                    child: Icon(
                      wasPressed ? CustomIcon.moonLineIcon : CustomIcon.sunIcon,
                      size: widget.screenSize * 0.01953125,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
