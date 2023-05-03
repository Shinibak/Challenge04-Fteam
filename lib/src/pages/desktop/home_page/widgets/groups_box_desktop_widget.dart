import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import '../../../../mockup/groups_data.dart';
import 'expanded_list_desktop_widget.dart';

class GroupsBoxDesktopWidget extends StatelessWidget {
  final double screenSize;
  GroupsBoxDesktopWidget({
    super.key,
    required this.screenSize,
  });

  final groups = groupsDataList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenSize * 0.3046875,
      child: Padding(
        padding: EdgeInsets.only(
          top: screenSize * 0.029296875,
          left: screenSize * 0.01953125,
          right: screenSize * 0.01953125,
        ),
        child: Column(
          children: [
            SearchDesktopWidget(
              screenSize: screenSize,
            ),
            SizedBox(height: screenSize * 0.033203125),
            Expanded(
              child: ListView.builder(
                itemCount: groups.length,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: screenSize * 0.029296875),
                    child: ExpandedListDesktopWidget(
                      group: groups[index].text,
                      active: groups[index].active,
                      screenSize: screenSize,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
