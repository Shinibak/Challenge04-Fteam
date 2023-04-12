import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'avatar_desktop_widget.dart';

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
      width: screenSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(screenSize * 0.096),
        ),
        color: theme.profileCardTheme,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: screenSize * 0.133),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AvatarDesktopWidget(
                avatarImage: avatarImage,
                screenSize: screenSize,
              ),
              Column(
                children: [
                  SizedBox(height: screenSize * 0.026),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: textStyle.bodyText1,
                      ),
                      SizedBox(width: screenSize * 0.0106),
                      OnlineStatusWidget(
                        isOnline: isOnline,
                        screenSize: screenSize * 0.026,
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize * 0.037),
                  Text(
                    number,
                    style: textStyle.subtitle2,
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: screenSize * 0.048),
          Row(
            children: [
              SizedBox(
                width: screenSize * 0.112,
              ),
              ProfileButtonsWidget(
                icon: CustomIcon.callingIcon,
                buttonSize: screenSize * 0.16,
                iconSize: screenSize * 0.058,
                borderRadius: screenSize * 0.04,
                active: true,
              ),
              SizedBox(width: screenSize * 0.04),
              ProfileButtonsWidget(
                icon: CustomIcon.videoCallIcon,
                buttonSize: screenSize * 0.16,
                iconSize: screenSize * 0.058,
                active: true,
                borderRadius: screenSize * 0.04,
              ),
              SizedBox(width: screenSize * 0.04),
              ProfileButtonsWidget(
                icon: CustomIcon.volumeMuteIcon,
                buttonSize: screenSize * 0.16,
                iconSize: screenSize * 0.058,
                active: true,
                borderRadius: screenSize * 0.04,
              ),
              SizedBox(width: screenSize * 0.04),
              ProfileButtonsWidget(
                icon: CustomIcon.suitcaseOutlineIcon,
                buttonSize: screenSize * 0.16,
                iconSize: screenSize * 0.058,
                borderRadius: screenSize * 0.04,
                active: false,
              ),
            ],
          ),
          SizedBox(height: screenSize * 0.037),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenSize * 0.010),
              Text(
                status,
                style: textStyle.caption,
              ),
              SizedBox(width: screenSize * 0.016),
              Icon(
                CustomIcon.handWaveIcon,
                size: screenSize * 0.048,
                color: Colors.amber,
              ),
            ],
          ),
          SizedBox(height: screenSize * 0.026),
          Text(
            'Our company are looking for:',
            style: textStyle.subtitle2,
          ),
          SizedBox(height: screenSize * 0.037),
          SizedBox(
            width: screenSize * 0.60,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: screenSize * 0.021,
              runSpacing: screenSize * 0.021,
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
    );
  }
}
