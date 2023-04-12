import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});
  final double screenSize = 375;

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      devices: [
        Apple.iPhone8,
        Desktop.desktop1080p,
      ],
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: lightTheme,
        ),
        WidgetbookTheme(
          name: 'Dark',
          data: darkTheme,
        ),
      ],
      appInfo: AppInfo(name: 'Example'),
      categories: [
        WidgetbookCategory(
          name: 'widgets',
          widgets: [
            WidgetbookComponent(
              name: 'notification Box',
              useCases: [
                WidgetbookUseCase(
                  name: 'selected',
                  builder: (context) => NotificationMobileWidget(
                    activeNotification: true,
                    notification: 34,
                    screenSize: MediaQuery.of(context).size.width,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'unselected',
                  builder: (context) => NotificationMobileWidget(
                    activeNotification: false,
                    notification: 34,
                    screenSize: screenSize,
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Filter Button',
              useCases: [
                WidgetbookUseCase(
                  name: 'selected Filter true',
                  builder: (context) => FilterButtonMobileWidget(
                    text: 'All',
                    icon: CustomIcon.archiveIcon,
                    notifications: 35,
                    active: true,
                    screenSize: screenSize,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'selected Filter False',
                  builder: (context) => FilterButtonMobileWidget(
                    text: 'All',
                    icon: CustomIcon.archiveIcon,
                    notifications: 35,
                    active: false,
                    screenSize: screenSize,
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'App Bar Button',
              useCases: [
                WidgetbookUseCase(
                  name: 'Button',
                  builder: (context) => MenuButtonMobileWidget(
                    icon: CustomIcon.chatBoxIcon,
                    active: true,
                    screenSize: screenSize,
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'search Box',
              useCases: [
                WidgetbookUseCase(
                  name: 'search',
                  builder: (context) => SearchMobileWidget(
                    screenSize: screenSize,
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'chat message',
              useCases: [
                WidgetbookUseCase(
                  name: 'send',
                  builder: (context) => MessageSentMobileWidget(
                    message: 'batata',
                    screenSize: screenSize,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'received',
                  builder: (context) => MessageReceiveMobileWidget(
                    message: 'batata',
                    screenSize: screenSize,
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Profile Button',
              useCases: [
                WidgetbookUseCase(
                  name: 'profile button true',
                  builder: (context) => ProfileButtonsWidget(
                    icon: CustomIcon.volumeMuteIcon,
                    active: true,
                    buttonSize: screenSize * 0.16,
                    iconSize: screenSize * 0.058,
                    borderRadius: screenSize * 0.04,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'profile button False',
                  builder: (context) => ProfileButtonsWidget(
                    icon: CustomIcon.volumeMuteIcon,
                    active: false,
                    buttonSize: screenSize * 0.16,
                    iconSize: screenSize * 0.058,
                    borderRadius: screenSize * 0.04,
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Menu Button mobile',
              useCases: [
                WidgetbookUseCase(
                  name: 'Menu button true',
                  builder: (context) => MenuButtonMobileWidget(
                    icon: CustomIcon.statisticsChart,
                    active: true,
                    screenSize: screenSize,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Menu button False',
                  builder: (context) => MenuButtonMobileWidget(
                    icon: CustomIcon.statisticsChart,
                    active: false,
                    screenSize: screenSize,
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Online status',
              useCases: [
                WidgetbookUseCase(
                  name: 'online true',
                  builder: (context) => OnlineStatusWidget(
                    isOnline: true,
                    screenSize: screenSize,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'online false',
                  builder: (context) => OnlineStatusWidget(
                    isOnline: false,
                    screenSize: screenSize,
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Avatar Icon',
              useCases: [
                WidgetbookUseCase(
                  name: 'Avatar notifications',
                  builder: (context) => AvatarNotificationMobileWidget(
                    notifications: 23,
                    active: true,
                    avatarImage: 'assets/avatar/avatar.png',
                    screenSize: screenSize,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Avatar Todo List',
                  builder: (context) => AvatarMobileWidget(
                    avatarImage: 'assets/avatar/avatar.png',
                    screenSize: screenSize,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Avatar Todo List',
                  builder: (context) => AvatarChatMobileWidget(
                    avatarImage: 'assets/avatar/avatar.png',
                    screenSize: screenSize,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
