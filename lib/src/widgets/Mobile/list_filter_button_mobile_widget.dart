import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ListFilterButtonMobileWidget extends StatelessWidget {
  final List filterList;
  final double screenSize;
  const ListFilterButtonMobileWidget({
    super.key,
    required this.filterList,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: filterList.length,
      itemBuilder: (BuildContext context, int index) {
        if (index > 0) {
          return FilterButtonMobileWidget(
            text: filterList[index].text,
            icon: filterList[index].icon,
            notifications: filterList[index].notifications,
            active: filterList[index].active,
            screenSize: screenSize,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
