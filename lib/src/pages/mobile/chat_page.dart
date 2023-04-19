import 'package:challenge04_fteam/src/widgets/Mobile/app_bar_chat_mobile_widget.dart';
import 'package:challenge04_fteam/src/widgets/Mobile/chat_list_mobile_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import '../../models/profile_model.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: cast_nullable_to_non_nullable
    final profile = ModalRoute.of(context)!.settings.arguments as ProfileModel;
    final screenSize = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: Column(
              children: [
                AppBarChatMobileWidget(
                  profile: profile,
                  screenSize: screenSize,
                ),
                ChatListMobileWidget(
                  profile: profile,
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
