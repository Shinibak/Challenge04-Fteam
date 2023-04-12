import 'package:challenge04_fteam/src/models/profile_model.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AppBarChatWidget extends StatelessWidget {
  final ProfileModel profile;
  final double screenSize;

  const AppBarChatWidget({
    super.key,
    required this.profile,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Container(
      height: screenSize * 0.261,
      width: screenSize,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Column(
        children: [
          SizedBox(height: screenSize * 0.117),
          Row(
            children: [
              SizedBox(width: screenSize * 0.048),
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
                      '/tree',
                      arguments: profile,
                    );
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
