import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class ChatPreviewMobileWidget extends StatelessWidget {
  final String avatarImage;
  final String name;
  final String number;
  final String lastMessageData;
  final String lastMessage;
  final bool muted;
  final int notifications;
  final bool online;
  final double screenSize;
  const ChatPreviewMobileWidget({
    super.key,
    required this.notifications,
    required this.avatarImage,
    required this.name,
    required this.number,
    required this.lastMessageData,
    required this.lastMessage,
    required this.muted,
    required this.online,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeCustom>()!;
    final text = Theme.of(context).textTheme;

    return SizedBox(
      height: screenSize * 0.186,
      width: screenSize * 0.901,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AvatarNotificationMobileWidget(
                screenSize: screenSize,
                avatarImage: avatarImage,
                notifications: notifications,
                active: true,
              )
            ],
          ),
          SizedBox(width: screenSize * 0.042),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenSize * 0.010),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          name,
                          style: text.bodyText2,
                        ),
                        SizedBox(width: screenSize * 0.016),
                        OnlineStatusWidget(
                          isOnline: online,
                          screenSize: screenSize * 0.026,
                        ),
                      ],
                    ),
                    Text(
                      lastMessageData,
                      style: text.caption,
                    ),
                  ],
                ),
                SizedBox(height: screenSize * 0.026),
                Row(
                  children: [
                    Text(number, style: text.bodySmall),
                  ],
                ),
                // SizedBox(height: screenSize * 0.021),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: screenSize * 0.0053),
                        Text(
                          lastMessage,
                          style: text.bodyText1,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.notifications_off_outlined,
                          color: muted ? theme.mutedIcon : theme.buttonColorOff,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
