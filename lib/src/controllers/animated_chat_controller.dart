import 'package:challenge04_fteam/src/models/profile_model.dart';
import 'package:flutter/material.dart';

class AnimatedChatController extends ChangeNotifier {
  late ProfileModel _profile;
  bool _openChat = false;

  openChat(ProfileModel profile) {
    _profile = profile;
    _openChat = !_openChat;
    notifyListeners();
  }

  bool isOpen() {
    final open = _openChat;
    notifyListeners();
    return open;
  }

  ProfileModel getChat() {
    final profile = _profile;
    notifyListeners();
    return profile;
  }
}
