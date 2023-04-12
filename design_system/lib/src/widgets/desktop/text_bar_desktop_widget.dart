import 'package:flutter/material.dart';
import '../../../design_system.dart';

class TextBarDesktopWidget extends StatelessWidget {
  final double screenSize;
  const TextBarDesktopWidget({super.key, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeCustom>()!;
    final iconColor = Theme.of(context).iconTheme.color;

    return Container(
      width: screenSize * 0.898,
      height: screenSize * 0.154,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenSize * 0.042),
        color:theme.backOpacity,
      ),
      child: Row(
        children: [
          SizedBox(width: screenSize * 0.048),
          SizedBox(
            width: screenSize * 0.469,
            child: const Text(''),
          ),
          SizedBox(width: screenSize * 0.064),
          Icon(
            CustomIcon.happyIcon,
            color: iconColor,
            size: screenSize * 0.058,
          ),
          SizedBox(width: screenSize * 0.026),
          Icon(
            CustomIcon.paperClipIcon,
            color: iconColor,
            size: screenSize * 0.058,
          ),
          SizedBox(width: screenSize * 0.0373),
          Container(
            height: screenSize * 0.106,
            width: screenSize * 0.106,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenSize * 0.042),
              color: theme.buttonColorOn,
            ),
            child: Center(
              child: Icon(
                CustomIcon.sentIcon,
                size: screenSize * 0.053,
                color: theme.back,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
