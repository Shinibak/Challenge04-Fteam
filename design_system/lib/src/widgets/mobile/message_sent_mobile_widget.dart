import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class MessageSentMobileWidget extends StatelessWidget {
  final double screenSize;
  final String message;
  const MessageSentMobileWidget({
    super.key,
    required this.message,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final theme = Theme.of(context).extension<ThemeCustom>()!;
  
    return Row(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: screenSize * 0.165,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(screenSize * 0.042),
              topLeft: Radius.circular(screenSize * 0.042),
              bottomLeft: Radius.circular(screenSize * 0.042),
            ),
            color: theme.sendMsg,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(width: screenSize * 0.048),
                  Text(
                    message,
                    style: textStyle.button,
                  ),
                  SizedBox(width: screenSize * 0.048),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
