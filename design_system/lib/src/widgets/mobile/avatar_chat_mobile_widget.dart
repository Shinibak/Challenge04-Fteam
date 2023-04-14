import 'package:flutter/material.dart';

class AvatarChatMobileWidget extends StatelessWidget {
  final String avatarImage;
  final double screenSize;
  const AvatarChatMobileWidget({
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
