import 'package:challenge04_fteam/src/controllers/chat_controller.dart';
import 'package:challenge04_fteam/src/mockup/profiles_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'profile_box_widget.dart';

class OpenProfileWidget extends StatefulWidget {
  final double screenSize;

  const OpenProfileWidget({
    super.key,
    required this.screenSize,
  });

  @override
  State<OpenProfileWidget> createState() => _OpenProfileWidgetState();
}

class _OpenProfileWidgetState extends State<OpenProfileWidget>
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
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return ClipRRect(
          child: Align(
            widthFactor: sizeWidth(chatController.profileIsOpen),
            alignment: Alignment.topLeft,
            child: Expanded(
              child: ProfileBoxDesktopWidget(
                screenSize: widget.screenSize,
                profile: chatController.getProfile,
              ),
            ),
          ),
        );
      },
    );
  }
}
