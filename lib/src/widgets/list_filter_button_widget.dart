import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ListFilterButtonWidget extends StatelessWidget {
  final List filterList;
  final double screenSize;
  const ListFilterButtonWidget({
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
        return FilterButtonWidget(
          text: filterList[index].text,
          icon: filterList[index].icon,
          notifications: filterList[index].notifications,
          active: filterList[index].active,
          screenSize: screenSize,
        );
      },
    );
  }
}
