import 'package:flutter/material.dart';
import '../../themes/theme_extensions.dart';

class SearchDesktopWidget extends StatelessWidget {
  final double screenSize;
  const SearchDesktopWidget({super.key, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final theme = Theme.of(context).extension<ThemeCustom>()!;    

    return Container(
      height: screenSize * 0.16,
      width: screenSize * 0.906,
      decoration: BoxDecoration(
        color: theme.backOpacity,
        borderRadius: BorderRadius.circular(screenSize * 0.053),
      ),
      child: Row(
        children: [
          SizedBox(
            width: screenSize * 0.053,
          ),
          Icon(
            Icons.search,
            color: Theme.of(context).iconTheme.color,
            size: screenSize * 0.058,
          ),
          SizedBox(
            width: screenSize * 0.037,
          ),
          Text(
            'Search',
            style: textStyle.subtitle2,
          ),
        ],
      ),
    );
  }
}
