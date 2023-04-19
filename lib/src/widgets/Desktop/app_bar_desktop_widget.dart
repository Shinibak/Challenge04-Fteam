import 'package:challenge04_fteam/src/mockup/menu_buttons_data.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'switch_theme_button_widget.dart';

class AppBarDesktopWidget extends StatelessWidget {
  final double screenSize;
  const AppBarDesktopWidget({super.key, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeCustom>()!;
    final textStyle = Theme.of(context).textTheme;
    final menu = menuButtonsDataList;

    return SizedBox(
      height: screenSize * 0.103515625,
      child: Row(
        children: [
          SizedBox(width: screenSize * 0.033203125),
          Text(
            'NeWorkers',
            style: textStyle.headline5,
          ),
          SizedBox(width: screenSize * 0.029296875),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: menu.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return MenuButtonDesktopWidget(
                  icon: menu[index].icon,
                  title: menu[index].name,
                  active: menu[index].active,
                  screenSize: screenSize,
                );
              },
            ),
          ),
          SwitchThemeButtonWidget(
            screenSize: screenSize,
          ),
          SizedBox(width: screenSize * 0.01953125),
          Icon(
            CustomIcon.phoneOutlineIcon,
            color: Theme.of(context).iconTheme.color,
            size: screenSize * 0.0234375,
          ),
          SizedBox(width: screenSize * 0.01953125),
          Stack(
            children: [
              SizedBox(
                height: screenSize * 0.0234375,
                width: screenSize * 0.0234375,
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Icon(
                  CustomIcon.notificationBellIcon,
                  color: Theme.of(context).iconTheme.color,
                  size: screenSize * 0.0234375,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  height: screenSize * 0.0078125,
                  width: screenSize * 0.0078125,
                  decoration: BoxDecoration(
                    color: theme.buttonColorOn,
                    borderRadius:
                        BorderRadius.circular(screenSize * 0.00390625),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: screenSize * 0.046875),
        ],
      ),
    );
  }
}
