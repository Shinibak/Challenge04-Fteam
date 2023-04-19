import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class ChatPreviewDesktopWidget extends StatefulWidget {
  final String avatarImage;
  final String name;
  final String number;
  final String lastMessageData;
  final String lastMessage;
  final bool muted;
  final int notifications;
  final bool online;

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
  });

  @override
  State<ChatPreviewDesktopWidget> createState() =>
      _ChatPreviewDesktopWidgetState();
}

class _ChatPreviewDesktopWidgetState extends State<ChatPreviewDesktopWidget> {
  var wasPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeCustom>()!;
    final text = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        setState(
          () {
            wasPressed = !wasPressed;
          },
        );
      },
      child: Container(
        height: widget.screenSize * 0.095703125,
        width: widget.screenSize * 0.265625,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.screenSize * 0.017578125),
          color: wasPressed ? theme.todoColorOff : theme.offColor,
        ),
        child: Row(
          children: [
            SizedBox(width: widget.screenSize * 0.009765625),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: widget.screenSize * 0.013671875),
                AvatarNotificationDesktopWidget(
                  screenSize: widget.screenSize,
                  avatarImage: widget.avatarImage,
                  notifications: widget.notifications,
                  active: true,
                )
              ],
            ),
            SizedBox(width: widget.screenSize * 0.015625),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(width: widget.screenSize * 0.099609375),
                      Icon(
                        Icons.notifications_off_outlined,
                        color: widget.muted
                            ? theme.mutedIcon
                            : theme.buttonColorOff,
                        size: widget.screenSize * 0.013671875,
                      ),
                    ],
                  ),
                  SizedBox(height: widget.screenSize * 0.001953125),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.name,
                            style: text.bodyText2,
                          ),
                          SizedBox(width: widget.screenSize * 0.00390625),
                          OnlineStatusWidget(
                            isOnline: widget.online,
                            screenSize: widget.screenSize * 0.009765625,
                          ),
                        ],
                      ),
                      Text(
                        widget.lastMessageData,
                        style: text.caption,
                      ),
                    ],
                  ),
                  SizedBox(height: widget.screenSize * 0.009765625),
                  Text(widget.number, style: text.caption),
                  SizedBox(height: widget.screenSize * 0.013671875),
                  Text(
                    widget.lastMessage,
                    style: text.subtitle2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
