import 'package:challenge04_fteam/src/mockup/profiles_data.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/chat_controller.dart';

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
  late ChatController chatController;
  double turns = 0;

  double sizeHeight() {
    final double _size;
    var _quantidade = 0;
    final _i = profileList.length - 1;
    var _index = 0;
    do {
      if (widget.group == profileList[_index].group) {
        _quantidade++;
      } else if (widget.group == 'All Message') {
        _quantidade = _i;
      }
      _index++;
    } while (_index <= _i);
    // ignore: join_return_with_assignment
    _size = (widget.screenSize * 0.048) +
        (_quantidade * (widget.screenSize * 0.261));

    return _size;
  }

  @override
  Widget build(BuildContext context) {
    chatController = context.watch<ChatController>();
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
          height: wasPassed ? sizeHeight() : 0,
          child: Padding(
            padding: EdgeInsets.only(top: widget.screenSize * 0.048),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: profileList.length - 1,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                if (widget.group == profileList[index].group) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/two');
                      chatController.openChat(profileList[index]);
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
                } else if (widget.group == 'All Message') {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/two');
                      chatController.openChat(profileList[index]);
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
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
