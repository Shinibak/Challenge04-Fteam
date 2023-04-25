import 'package:challenge04_fteam/src/mockup/profiles_data.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/animated_chat_controller.dart';

class ExpandedListMobileWidget extends StatefulWidget {
  final String group;
  final bool active;
  final double screenSize;
  const ExpandedListMobileWidget({
    super.key,
    required this.group,
    required this.active,
    required this.screenSize,
  });

  @override
  State<ExpandedListMobileWidget> createState() =>
      _ExpandedListMobileWidgetState();
}

class _ExpandedListMobileWidgetState extends State<ExpandedListMobileWidget> {
  late bool wasPassed = widget.active;
  final profileList = profilesDataList;
  late AnimatedChatController controller;
  double turns = 0;

  @override
  Widget build(BuildContext context) {
    controller = context.watch<AnimatedChatController>();
    final textStyle = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => setState(() {
            wasPassed = !wasPassed;
            if (wasPassed) {
              turns -= 1.0 / 2.0;
            } else {
              turns += 1.0 / 2.0;
            }
          }),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.group,
                  style: textStyle.subtitle2,
                ),
              ),
              AnimatedRotation(
                turns: turns,
                duration: const Duration(milliseconds: 120),
                child: Icon(
                  Icons.expand_more,
                  size: widget.screenSize * 0.037,
                ),
              ),
            ],
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          height: wasPassed
              ? (widget.screenSize * 0.048) +
                  ((profileList.length - 1) * (widget.screenSize * 0.261)) +
                  (widget.screenSize * 0.186)
              : 0,
          child: Padding(
            padding: EdgeInsets.only(top: widget.screenSize * 0.048),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: profileList.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/two',
                    );
                    controller.isOpenChat(profileList[index]);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: index < profileList.length - 1
                          ? widget.screenSize * 0.074
                          : 0,
                    ),
                    child: ChatPreviewMobileWidget(
                      notifications: profileList[index].notifications,
                      avatarImage: profileList[index].avatarImage,
                      name: profileList[index].name,
                      number: profileList[index].number,
                      lastMessageData: profileList[index].messages.last.hour,
                      lastMessage:
                          profileList[index].messages.last.message.last,
                      muted: profileList[index].isMuted,
                      online: profileList[index].isOnline,
                      screenSize: widget.screenSize,
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
