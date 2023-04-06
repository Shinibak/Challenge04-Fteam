import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class IncomingMessageWidget extends StatelessWidget {
  final String profilePicture;
  final String name;
  final String hours;
  final List messages;
  final double screenSize;
  const IncomingMessageWidget({
    super.key,
    required this.hours,
    required this.messages,
    required this.profilePicture,
    required this.name,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AvatarChatWidget(
              avatarImage: profilePicture,
              screenSize: screenSize,
            ),
            SizedBox(width: screenSize * 0.032),
            Text(
              name,
              style: textStyle.headline6,
            ),
            SizedBox(width: screenSize * 0.048),
            Text(
              hours,
              style: textStyle.overline,
            ),
          ],
        ),
        SizedBox(height: screenSize * 0.026),
        SizedBox(
          height: messages.length * (screenSize * 0.186),
          width: screenSize,
          child: ListView.builder(
            itemCount: messages.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: screenSize * 0.021,
                ),
                child: MessageReceiveWidget(
                  message: messages[index],
                  screenSize: screenSize,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
