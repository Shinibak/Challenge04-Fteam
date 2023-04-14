import 'package:flutter/material.dart';

class AvatarDesktopWidget extends StatelessWidget {
  final String avatarImage;
  final double screenSize;
  const AvatarDesktopWidget({
    super.key,
    required this.avatarImage,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize * 0.04296875,
      width: screenSize * 0.04296875,
      child: CircleAvatar(
        backgroundImage: AssetImage(avatarImage),
        radius: screenSize * 0.021484375,
      ),
    );
  }
}
