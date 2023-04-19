import 'package:challenge04_fteam/src/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'incoming_message_desktop_widget.dart';
import 'sent_message_desktop_widget.dart';

class ChatMessagesDesktopWidget extends StatelessWidget {
  final ProfileModel profile;
  final double screenSize;
  const ChatMessagesDesktopWidget({
    super.key,
    required this.profile,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: profile.messages.length,
        itemBuilder: (BuildContext context, int index) {
          return profile.messages[index].sending
              ? Padding(
                  padding: EdgeInsets.only(
                    top: screenSize * 0.025390625,
                    right: screenSize * 0.01953125,
                    left: screenSize * 0.01953125,
                  ),
                  child: SentMessageDesktopWidget(
                    hours: profile.messages[index].hour,
                    messages: profile.messages[index].message,
                    screenSize: screenSize,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(
                    top: screenSize * 0.0234375,
                    right: screenSize * 0.01953125,
                    left: screenSize * 0.01953125,
                  ),
                  child: IncomingMessageDesktopWidget(
                    hours: profile.messages[index].hour,
                    messages: profile.messages[index].message,
                    profilePicture: profile.messages[index].profilePicture,
                    name: profile.name,
                    screenSize: screenSize,
                  ),
                );
        },
      ),
    );
  }
}
