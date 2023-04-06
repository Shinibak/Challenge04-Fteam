import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class SentMessageWidget extends StatelessWidget {
  final String hours;
  final List messages;
    final double screenSize;
  const SentMessageWidget({
    super.key,
    required this.hours,
    required this.messages, required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
   
    final textStyle = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          hours,
          style: textStyle.overline,
        ),
        SizedBox(height: screenSize * 0.032),
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
                child: MessageSentWidget(
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
