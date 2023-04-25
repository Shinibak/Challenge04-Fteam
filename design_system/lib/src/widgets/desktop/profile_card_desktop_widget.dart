import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ProfileCardDesktopWidget extends StatelessWidget {
  final String avatarImage;
  final String name;
  final bool isOnline;
  final String number;
  final String status;
  final List skills;
  final double screenSize;
  const ProfileCardDesktopWidget({
    super.key,
    required this.avatarImage,
    required this.name,
    required this.isOnline,
    required this.number,
    required this.status,
    required this.skills,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeCustom>()!;
    final textStyle = Theme.of(context).textTheme;

    return Container(
      width: screenSize * 0.234375,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenSize * 0.017578125),
        color: theme.profileCardTheme,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: screenSize * 0.017578125,
          bottom: screenSize * 0.01953125,
          left: screenSize * 0.017578125,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AvatarDesktopWidget(
                  avatarImage: avatarImage,
                  screenSize: screenSize,
                ),
                SizedBox(width: screenSize * 0.009765625),
                Column(
                  children: [
                    SizedBox(height: screenSize * 0.00390625),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: textStyle.bodyText1,
                        ),
                        SizedBox(width: screenSize * 0.00390625),
                        OnlineStatusWidget(
                          isOnline: isOnline,
                          screenSize: screenSize * 0.009765625,
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize * 0.0078125),
                    Text(
                      number,
                      style: textStyle.subtitle1,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: screenSize * 0.013671875),
            Row(
              children: [
                ProfileButtonsDesktopWidget(
                  icon: CustomIcon.callingIcon,
                  active: true,
                  screenSize: screenSize,
                ),
                SizedBox(width: screenSize * 0.009765625),
                ProfileButtonsDesktopWidget(
                  icon: CustomIcon.videoCallIcon,
                  active: true,
                  screenSize: screenSize,
                ),
                SizedBox(width: screenSize * 0.009765625),
                ProfileButtonsDesktopWidget(
                  icon: CustomIcon.volumeMuteIcon,
                  active: true,
                  screenSize: screenSize,
                ),
                SizedBox(width: screenSize * 0.009765625),
                ProfileButtonsDesktopWidget(
                  icon: CustomIcon.suitcaseOutlineIcon,
                  active: false,
                  screenSize: screenSize,
                ),
              ],
            ),
            SizedBox(height: screenSize * 0.015625),
            Row(
              children: [
                Text(
                  status,
                  style: textStyle.caption,
                ),
                SizedBox(width: screenSize * 0.00390625),
                Icon(
                  CustomIcon.handWaveIcon,
                  size: screenSize * 0.015625,
                  color: Colors.amber,
                ),
              ],
            ),
            SizedBox(height: screenSize * 0.009765625),
            Text(
              'Our company are looking for:',
              style: textStyle.caption,
            ),
            SizedBox(height: screenSize * 0.01953125),
            SizedBox(
              width: screenSize * 0.166015625,
              child: Wrap(
                spacing: screenSize * 0.009765625,
                runSpacing: screenSize * 0.009765625,
                children: List.generate(
                  skills.length,
                  (index) {
                    return ProfileSkillsDesktopWidget(
                      backgroundColor: skills[index].color,
                      title: skills[index].skill,
                      screenSize: screenSize,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
