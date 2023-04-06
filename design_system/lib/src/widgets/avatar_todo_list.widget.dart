import 'package:flutter/material.dart';

class AvatarTodoListWidget extends StatelessWidget {
  final String avatarImage;
  final double screenSize;
  const AvatarTodoListWidget({
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
