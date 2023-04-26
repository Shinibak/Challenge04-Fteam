import 'package:flutter/material.dart';

class MessageReceiveDesktopWidget extends StatelessWidget {
  final double screenSize;
  final String message;
  const MessageReceiveDesktopWidget({
    super.key,
    required this.message,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: screenSize * 0.064453125,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(screenSize * 0.017578125),
              bottomLeft: Radius.circular(screenSize * 0.017578125),
              bottomRight: Radius.circular(screenSize * 0.017578125),
            ),
            color: Colors.red,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
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
