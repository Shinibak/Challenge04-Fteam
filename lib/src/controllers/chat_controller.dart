import 'package:challenge04_fteam/src/models/profile_model.dart';
import 'package:flutter/material.dart';

class ChatController extends ChangeNotifier {
  late ProfileModel _profile = profileInit();
  var _openChat = false;
  var _openProfile = false;

  void isOpenChat(ProfileModel profile) {
    if (_openChat) {
      if (_profile.name == profile.name) {
        _openChat = false;
        _openProfile = false;
      } else {
        _openChat = true;
        _openProfile = false;
        _profile = profile;
      }
    } else {
      _openChat = true;
      _openProfile = false;
      _profile = profile;
    }
    notifyListeners();
  }

  void isOpenProfile() {
    _openProfile = !_openProfile;
    notifyListeners();
  }

  ProfileModel getProfile() {
    return _profile;
  }

  bool openProfile() {
    return _openProfile;
  }

  bool openChat() {
    return _openChat;
  }

  ProfileModel profileInit() {
    final profile = ProfileModel(
      avatarImage: 'assets/avatar/cris.jpg',
      isMuted: true,
      name: '',
      number: '',
      isOnline: false,
      status: '',
      notifications: 0,
      messages: [],
      skills: [],
      group: '',
    );
    return profile;
  }
}
