import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class MessageSentDesktopWidget extends StatelessWidget {
  final double screenSize;
  final String message;
  const MessageSentDesktopWidget({
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
          height: screenSize * 0.064453125,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(screenSize * 0.017578125),
              topLeft: Radius.circular(screenSize * 0.017578125),
              bottomLeft: Radius.circular(screenSize * 0.017578125),
            ),
            color: theme.sendMsg,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(width: screenSize * 0.01953125),
                  Text(
                    message,
                    style: textStyle.button,
                  ),
                  SizedBox(width: screenSize * 0.01953125),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
