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
      height: screenSize * 0.08,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(screenSize * 0.021),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(screenSize * 0.021),
            child: Text(
              title,
              style: textStyle.caption,
            ),
          ),
        ],
      ),
    );
  }
}
