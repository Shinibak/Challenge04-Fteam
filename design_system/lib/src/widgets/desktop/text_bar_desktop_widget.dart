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
      width: screenSize * 0.5292968758,
      height: screenSize * 0.0625,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenSize * 0.017578125),
        color: theme.backOpacity,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            CustomIcon.happyIcon,
            color: iconColor,
            size: screenSize * 0.0234375,
          ),
          SizedBox(width: screenSize * 0.009765625),
          Icon(
            CustomIcon.paperClipIcon,
            color: iconColor,
            size: screenSize * 0.0234375,
          ),
          SizedBox(width: screenSize * 0.009765625),
          Icon(
            CustomIcon.imagePhotographyIcon,
            color: iconColor,
            size: screenSize * 0.0234375,
          ),
          SizedBox(width: screenSize * 0.009765625),
          Icon(
            Icons.voicemail,
            color: iconColor,
            size: screenSize * 0.0234375,
          ),
          SizedBox(width: screenSize * 0.021484375),
          Container(
            height: screenSize * 0.041015625,
            width: screenSize * 0.041015625,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenSize * 0.013671875),
              color: theme.buttonColorOn,
            ),
            child: Center(
              child: Icon(
                CustomIcon.sentIcon,
                size: screenSize * 0.01953125,
                color: theme.back,
              ),
            ),
          ),
          SizedBox(width: screenSize * 0.009765625),
        ],
      ),
    );
  }
}
