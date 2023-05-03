import 'package:challenge04_fteam/src/controllers/chat_controller.dart';
import 'package:challenge04_fteam/src/mockup/profiles_data.dart';
import 'package:challenge04_fteam/src/pages/desktop/home_page/widgets/open_profile_desktop_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_bar_chat_desktop_widget.dart';
import 'chat_messages_desktop_widget.dart';

class OpenChatMessageWidget extends StatefulWidget {
  final double screenSize;

  const OpenChatMessageWidget({
    super.key,
    required this.screenSize,
  });

  @override
  State<OpenChatMessageWidget> createState() => _OpenChatMessageWidgetState();
}

class _OpenChatMessageWidgetState extends State<OpenChatMessageWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> widthFactoAnimation;
  final profileList = profilesDataList;
  late ChatController chatController;

  @override
  void initState() {
    super.initState();
    chatController = context.read<ChatController>();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    widthFactoAnimation = Tween(
      // ignore: prefer_int_literals
      begin: 0.0,
      // ignore: prefer_int_literals
      end: 1.0,
    ).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  double sizeWidth(bool isOpen) {
    if (isOpen) {
      controller.forward();
    } else {
      controller.reverse();
    }
    return widthFactoAnimation.value;
  }

  @override
  Widget build(BuildContext context) {
    chatController = context.watch<ChatController>();
    final theme = Theme.of(context).extension<ThemeCustom>()!;
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return ClipRRect(
          child: Align(
            widthFactor: sizeWidth(chatController.chatIsOpen()),
            alignment: Alignment.topLeft,
            child: Expanded(
              child: Row(
                children: [
                  Container(
                    width: widget.screenSize * 0.5703125,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(widget.screenSize * 0.01953125),
                      ),
                      color: theme.chatColor,
                    ),
                    child: Stack(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              AppBarChatDesktopWidget(
                                profile: chatController.getProfile(),
                                screenSize: widget.screenSize,
                              ),
                              ChatMessagesDesktopWidget(
                                profile: chatController.getProfile(),
                                screenSize: widget.screenSize,
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: widget.screenSize * 0.015625,
                            ),
                            child: TextBarDesktopWidget(
                              screenSize: widget.screenSize,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: widget.screenSize * 0.01953125),
                  OpenProfileWidget(screenSize: widget.screenSize),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
