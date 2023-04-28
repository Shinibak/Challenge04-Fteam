import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class SentMessageDesktopWidget extends StatelessWidget {
  final String hours;
  final List messages;
  final double screenSize;
  const SentMessageDesktopWidget({
    super.key,
    required this.hours,
    required this.messages,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          child: Text(
            hours,
            style: textStyle.overline,
          ),
        ),
        SizedBox(height: screenSize * 0.013671875),
        SizedBox(
          height: messages.length * (screenSize * 0.07421875),
          width: screenSize,
          child: ListView.builder(
            itemCount: messages.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: screenSize * 0.009765625,
                ),
                child: MessageSentDesktopWidget(
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
