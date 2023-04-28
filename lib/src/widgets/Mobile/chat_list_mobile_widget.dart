import 'package:challenge04_fteam/src/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'incoming_message_mobile_widget.dart';
import 'sent_message_mobile_widget.dart';

class ChatListMobileWidget extends StatelessWidget {
  final ProfileModel profile;
  final double screenSize;
  const ChatListMobileWidget({
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
                    top: screenSize * 0.037,
                    right: screenSize * 0.064,
                    left: screenSize * 0.048,
                  ),
                  child: SentMessageMobileWidget(
                    hours: profile.messages[index].hour,
                    messages: profile.messages[index].message,
                    screenSize: screenSize,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(
                    top: screenSize * 0.026,
                    right: screenSize * 0.064,
                    left: screenSize * 0.048,
                  ),
                  child: IncomingMessageMobileWidget(
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
