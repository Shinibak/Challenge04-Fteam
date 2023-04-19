import 'package:challenge04_fteam/src/controllers/animated_chat_controller.dart';
import 'package:challenge04_fteam/src/mockup/groups_data.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'expanded_list_desktop_widget.dart';

class ChatBoxDesktopWidget extends StatelessWidget {
  final double screenSize;
  ChatBoxDesktopWidget({
    super.key,
    required this.screenSize,
  });

  final controller = AnimatedChatController();

  @override
  Widget build(BuildContext context) {
    final groups = groupsDataList;
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Row(
        children: [
          SizedBox(
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
                        return ExpandedListDesktopWidget(
                          group: groups[index].text,
                          active: groups[index].active,
                          screenSize: screenSize,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 120),
                  child: new Text("Toggle Me"),
                  height: 200,
                  color: Colors.tealAccent,
                  width: controller.isOpen() ? 200 : 0,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
