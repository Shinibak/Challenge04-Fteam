import 'package:flutter/material.dart';

class AvatarChatDesktopWidget extends StatelessWidget {
  final String avatarImage;
  final double screenSize;
  const AvatarChatDesktopWidget({
    super.key,
    required this.avatarImage,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize * 0.025390625,
      width: screenSize *  0.025390625,
      child: CircleAvatar(
        backgroundImage: AssetImage(avatarImage),
        radius: screenSize * 0.013671875,
      ),
    );
  }
}
