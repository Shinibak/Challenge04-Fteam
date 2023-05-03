import 'package:challenge04_fteam/src/pages/responsive_layout.dart';
import 'package:challenge04_fteam/src/pages/mobile/chat_page/widgets/app_bar_chat_mobile_widget.dart';
import 'package:challenge04_fteam/src/pages/mobile/chat_page/widgets/chat_list_mobile_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/chat_controller.dart';
import '../../desktop/home_page/home_desktop_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late ChatController chatController;

  @override
  void dispose() {
    super.dispose();
    chatController.closeChat();
  }

  @override
  Widget build(BuildContext context) {
    chatController = context.watch<ChatController>();
    final theme = Theme.of(context).extension<ThemeCustom>()!;
    final screenSize = MediaQuery.of(context).size.width;
    return ResponsiveLayout(
      mobile: Scaffold(
        body: Stack(
          children: [
            Expanded(
              child: Container(
                color: theme.chatColor,
                child: Column(
                  children: [
                    AppBarChatMobileWidget(
                      profile: chatController.getProfile,
                      screenSize: screenSize,
                    ),
                    ChatListMobileWidget(
                      profile: chatController.getProfile,
                      screenSize: screenSize,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: screenSize * 0.096),
                child: TextBarMobileWidget(
                  screenSize: screenSize,
                ),
              ),
            ),
          ],
        ),
      ),
      desktop: const HomeDesktopPage(),
    );
  }
}
