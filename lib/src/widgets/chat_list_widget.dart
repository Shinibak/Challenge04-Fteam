import 'package:challenge04_fteam/src/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'incoming_message_widget.dart';
import 'sent_message_widget.dart';

class ChatListWidget extends StatelessWidget {
  final ProfileModel profile;
  const ChatListWidget({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: screenSize.height - (screenSize.width * 0.261),
      width: screenSize.width,
      child: ListView.builder(
        itemCount: profile.messages.length,
        itemBuilder: (BuildContext context, int index) {
          return profile.messages[index].sending
              ? Padding(
                  padding: EdgeInsets.only(
                    bottom: screenSize.width * 0.026,
                    right: screenSize.width * 0.064,
                  ),
                  child: SentMessageWidget(
                    hours: profile.messages[index].hour,
                    messages: profile.messages[index].message,
                    screenSize: screenSize.width,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(
                    bottom: screenSize.width * 0.037,
                    left: screenSize.width * 0.048,
                  ),
                  child: IncomingMessageWidget(
                    hours: profile.messages[index].hour,
                    messages: profile.messages[index].message,
                    profilePicture: profile.messages[index].profilePicture,
                    name: profile.name,
                    screenSize: screenSize.width,
                  ),
                );
        },
      ),
    );
  }
}
