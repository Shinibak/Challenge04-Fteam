import 'package:challenge04_fteam/src/models/profile_model.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/chat_controller.dart';

class AppBarChatMobileWidget extends StatelessWidget {
  final ProfileModel profile;
  final double screenSize;
  AppBarChatMobileWidget({
    super.key,
    required this.profile,
    required this.screenSize,
  });

  late ChatController chatController;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
     final theme = Theme.of(context).extension<ThemeCustom>()!;
    chatController = context.watch<ChatController>();
    return Container(
      height: screenSize * 0.261,
      width: screenSize,
      decoration:  BoxDecoration(
        color: theme.back,
      ),
      child: Column(
        children: [
          SizedBox(height: screenSize * 0.117),
          Row(
            children: [
              SizedBox(width: screenSize * 0.001),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: screenSize * 0.042,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
              SizedBox(width: screenSize * 0.001),
              AvatarChatMobileWidget(
                avatarImage: profile.avatarImage,
                screenSize: screenSize,
              ),
              SizedBox(width: screenSize * 0.026),
              Expanded(
                child: Text(
                  profile.name,
                  style: textStyle.bodyText2,
                ),
              ),
              Container(
                height: screenSize * 0.106,
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(screenSize * 0.032),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/home/profile',
                    );
                    chatController.openProfile();
                  },
                  child: Column(
                    children: [
                      SizedBox(height: screenSize * 0.032),
                      Row(
                        children: [
                          SizedBox(width: screenSize * 0.042),
                          Text(
                            'Agree to Offer',
                            style: textStyle.bodyText2,
                          ),
                          SizedBox(width: screenSize * 0.042),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: screenSize * 0.037),
              Icon(
                CustomIcon.folderBookmarkIcon,
                color: Theme.of(context).iconTheme.color,
                size: screenSize * 0.058,
              ),
              SizedBox(width: screenSize * 0.026),
              Icon(
                CustomIcon.calcIcon,
                color: Theme.of(context).iconTheme.color,
                size: screenSize * 0.058,
              ),
              SizedBox(width: screenSize * 0.048),
            ],
          ),
        ],
      ),
    );
  }
}
