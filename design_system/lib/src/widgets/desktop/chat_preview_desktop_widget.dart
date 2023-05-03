// ignore_for_file: must_be_immutable

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class ChatPreviewDesktopWidget extends StatelessWidget {
  final String avatarImage;
  final String name;
  final String number;
  final String lastMessageData;
  final String lastMessage;
  final bool muted;
  final int notifications;
  final bool online;
  final bool isSelected;
  
  final double screenSize;

  const ChatPreviewDesktopWidget({
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
  
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeCustom>()!;
    final text = Theme.of(context).textTheme;

    return Container(
      height: screenSize * 0.1015625,
      width: screenSize * 0.265625,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenSize * 0.017578125),
        color: isSelected ? theme.todoColorOff : theme.offColor,
      ),
      child: Row(
        children: [
          SizedBox(width: screenSize * 0.009765625),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenSize * 0.013671875),
              AvatarNotificationDesktopWidget(
                screenSize: screenSize,
                avatarImage: avatarImage,
                notifications: notifications,
                active: true,
              )
            ],
          ),
          SizedBox(width: screenSize * 0.015625),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenSize * 0.001953125),
                Row(
                  children: [
                    SizedBox(width: screenSize * 0.099609375),
                    Icon(
                      Icons.notifications_off_outlined,
                      color: muted ? theme.mutedIcon : theme.buttonColorOff,
                      size: screenSize * 0.013671875,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          name,
                          style: text.bodyText2,
                        ),
                        SizedBox(width: screenSize * 0.00390625),
                        OnlineStatusWidget(
                          isOnline: online,
                          screenSize: screenSize * 0.009765625,
                        ),
                      ],
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Text(
                      lastMessageData,
                      style: text.caption,
                    ),
                    SizedBox(width: screenSize * 0.01171875),
                  ],
                ),
                SizedBox(height: screenSize * 0.009765625),
                Text(number, style: text.caption),
                SizedBox(height: screenSize * 0.013671875),
                Text(
                  lastMessage.length > 20
                      ? '${lastMessage.substring(1, 20)}...'
                      : lastMessage,
                  style: text.subtitle2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
