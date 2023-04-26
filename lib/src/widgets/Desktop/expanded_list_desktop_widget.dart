import 'package:challenge04_fteam/src/controllers/chat_controller.dart';
import 'package:challenge04_fteam/src/mockup/profiles_data.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpandedListDesktopWidget extends StatefulWidget {
  final String group;
  final bool active;
  final double screenSize;

  const ExpandedListDesktopWidget({
    super.key,
    required this.group,
    required this.active,
    required this.screenSize,
  });

  @override
  State<ExpandedListDesktopWidget> createState() =>
      _ExpandedListDesktopWidgetState();
}

class _ExpandedListDesktopWidgetState extends State<ExpandedListDesktopWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> rotationAnimation;
  late final Animation<double> heightFactoAnimation;
  late bool wasPassed = widget.active;
  final profileList = profilesDataList;
  late ChatController chatController;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    rotationAnimation = Tween(
      begin: 0.5,
      // ignore: prefer_int_literals
      end: 0.0,
    ).animate(controller);

    heightFactoAnimation = Tween(
      // ignore: prefer_int_literals
      begin: 0.0,
      // ignore: prefer_int_literals
      end: 1.0,
    ).animate(controller);
    if (wasPassed) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
    _size = (widget.screenSize * 0.0078125) +
        (_quantidade * (widget.screenSize * 0.09375)) +
        (widget.screenSize * 0.023529052734375);
    return _size;
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    chatController = context.watch<ChatController>();

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                wasPassed = !wasPassed;
                if (wasPassed) {
                  controller.forward();
                } else {
                  controller.reverse();
                }
              },
              child: Padding(
                padding: EdgeInsets.only(
                  left: widget.screenSize * 0.013671875,
                  right: widget.screenSize * 0.017578125,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.group,
                        style: textStyle.subtitle2,
                      ),
                    ),
                    RotationTransition(
                      turns: rotationAnimation,
                      child: Icon(
                        Icons.expand_more,
                        size: widget.screenSize * 0.013671875,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ClipRRect(
              child: Align(
                heightFactor: heightFactoAnimation.value,
                alignment: Alignment.topLeft,
                child: SizedBox(
                  height: sizeHeight(),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: widget.screenSize * 0.0078125),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: profileList.length - 1,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        if (widget.group == profileList[index].group) {
                          return ChatPreviewDesktopWidget(
                            notifications: profileList[index].notifications,
                            avatarImage: profileList[index].avatarImage,
                            name: profileList[index].name,
                            number: profileList[index].number,
                            lastMessageData:
                                profileList[index].messages.last.hour,
                            lastMessage:
                                profileList[index].messages.last.message.last,
                            muted: profileList[index].isMuted,
                            online: profileList[index].isOnline,
                            screenSize: widget.screenSize,
                            openChat: (value) {
                              chatController.isOpenChat(profileList[index]);
                            },
                            isSelected: chatController.getProfile().name ==
                                profileList[index].name,
                          );
                        } else if (widget.group == 'All Message') {
                          return ChatPreviewDesktopWidget(
                            notifications: profileList[index].notifications,
                            avatarImage: profileList[index].avatarImage,
                            name: profileList[index].name,
                            number: profileList[index].number,
                            lastMessageData:
                                profileList[index].messages.last.hour,
                            lastMessage:
                                profileList[index].messages.last.message.last,
                            muted: profileList[index].isMuted,
                            online: profileList[index].isOnline,
                            screenSize: widget.screenSize,
                            openChat: (value) {
                              chatController.isOpenChat(profileList[index]);
                            },
                            isSelected: chatController.getProfile().name ==
                                profileList[index].name,
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
