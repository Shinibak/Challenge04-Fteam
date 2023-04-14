import 'package:flutter/material.dart';

class ProfileSkillsDesktopWidget extends StatelessWidget {
  final double screenSize;
  final Color backgroundColor;
  final String title;
  const ProfileSkillsDesktopWidget({
    super.key,
    required this.backgroundColor,
    required this.title,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
      height: screenSize * 0.0234375,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(screenSize * 0.0078125),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: screenSize * 0.0078125),
          Text(
            title,
            style: textStyle.caption,
          ),
          SizedBox(width: screenSize * 0.0078125),
        ],
      ),
    );
  }
}
