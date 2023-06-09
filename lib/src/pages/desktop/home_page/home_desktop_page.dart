import 'package:challenge04_fteam/src/pages/desktop/home_page/widgets/app_bar_desktop_widget.dart';
import 'package:challenge04_fteam/src/pages/desktop/home_page/widgets/groups_box_desktop_widget.dart';
import 'package:challenge04_fteam/src/pages/desktop/home_page/widgets/open_chat_messages_desktop.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import '../../../mockup/filters_data.dart';

class HomeDesktopPage extends StatelessWidget {
  const HomeDesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeCustom>()!;
    final screenSize = MediaQuery.of(context).size.height;
    final filters = filtersDataList;

    return Scaffold(
      body: Column(
        children: [
          AppBarDesktopWidget(screenSize: screenSize),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: theme.back,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: screenSize * 0.2578125,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: screenSize * 0.0234375,
                        left: screenSize * 0.037109375,
                        right: screenSize * 0.037109375,
                      ),
                      child: ListView.builder(
                        itemCount: filters.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (BuildContext context, int index) {
                          return FilterButtonDesktopWidget(
                            text: filters[index].text,
                            icon: filters[index].icon,
                            notifications: filters[index].notifications,
                            active: filters[index].active,
                            screenSize: screenSize,
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: screenSize * 0.001953125),
                      child: Container(
                        color: Theme.of(context).backgroundColor,
                        child: Row(
                          children: [
                            GroupsBoxDesktopWidget(screenSize: screenSize),
                            Padding(
                              padding: EdgeInsets.only(
                                top: screenSize * 0.02734375,
                              ),
                              child: OpenChatMessageWidget(
                                screenSize: screenSize,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
