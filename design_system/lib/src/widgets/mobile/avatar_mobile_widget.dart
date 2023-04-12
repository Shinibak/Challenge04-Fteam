import 'package:flutter/material.dart';

class AvatarMobileWidget extends StatelessWidget {
  final String avatarImage;
  final double screenSize;
  const AvatarMobileWidget({
    super.key,
    required this.avatarImage,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize * 0.2133333,
      width: screenSize * 0.2133333,
      child: CircleAvatar(
        backgroundImage: AssetImage(avatarImage),
        radius: screenSize * 0.098,
      ),
    );
  }
}
