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
      height: screenSize * 0.064,
      width: screenSize * 0.064,
      child: CircleAvatar(
        backgroundImage: AssetImage(avatarImage),
        radius: screenSize * 0.032,
      ),
    );
  }
}
