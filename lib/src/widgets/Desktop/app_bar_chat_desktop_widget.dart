import 'package:challenge04_fteam/src/controllers/animated_chat_controller.dart';
import 'package:challenge04_fteam/src/models/profile_model.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarChatDesktopWidget extends StatelessWidget {
  final ProfileModel profile;
  final double screenSize;

  AppBarChatDesktopWidget({
    super.key,
    required this.profile,
    required this.screenSize,
  });

  late AnimatedChatController controller;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    controller = context.watch<AnimatedChatController>();
    return Container(
      height: screenSize * 0.060546875,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(screenSize * 0.01953125),
        ),
        color: Colors.black,
      ),
      child: Column(
        children: [
          SizedBox(height: screenSize * 0.009765625),
          Row(
            children: [
              SizedBox(width: screenSize * 0.01953125),
              AvatarChatDesktopWidget(
                avatarImage: profile.avatarImage,
                screenSize: screenSize,
              ),
              SizedBox(width: screenSize * 0.013671875),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      'Conversation With ',
                      style: textStyle.caption,
                    ),
                    Text(
                      profile.name,
                      style: textStyle.bodyText2,
                    ),
                  ],
                ),
              ),
              Container(
                height: screenSize * 0.0390625,
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(screenSize * 0.013671875),
                ),
                child: GestureDetector(
                  onTap: () => controller.isOpenProfile(),
                  child: Row(
                    children: [
                      SizedBox(width: screenSize * 0.015625),
                      Text(
                        'Agree to Offer',
                        style: textStyle.bodyText2,
                      ),
                      SizedBox(width: screenSize * 0.015625),
                    ],
                  ),
                ),
              ),
              SizedBox(width: screenSize * 0.013671875),
              Icon(
                CustomIcon.folderBookmarkIcon,
                color: Theme.of(context).iconTheme.color,
                size: screenSize * 0.021484375,
              ),
              SizedBox(width: screenSize * 0.01171875),
              Icon(
                CustomIcon.calcIcon,
                color: Theme.of(context).iconTheme.color,
                size: screenSize * 0.021484375,
              ),
              SizedBox(width: screenSize * 0.01953125),
            ],
          ),
        ],
      ),
    );
  }
}
