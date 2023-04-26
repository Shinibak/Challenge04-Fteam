import 'package:challenge04_fteam/src/widgets/Mobile/app_bar_chat_mobile_widget.dart';
import 'package:challenge04_fteam/src/widgets/Mobile/chat_list_mobile_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/chat_controller.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  late ChatController chatController;

  @override
  Widget build(BuildContext context) {
     chatController = context.watch<ChatController>();
  
    final screenSize = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: Column(
              children: [
                AppBarChatMobileWidget(
                  profile: chatController.getProfile(),
                  screenSize: screenSize,
                ),
                ChatListMobileWidget(
                  profile: chatController.getProfile(),
                  screenSize: screenSize,
                ),
              ],
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
    );
  }
}
