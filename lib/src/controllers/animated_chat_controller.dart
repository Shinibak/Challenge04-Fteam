import 'package:challenge04_fteam/src/models/profile_model.dart';
import 'package:flutter/material.dart';
import '../models/chat_model.dart';
import '../models/skiil_set_model.dart';

class AnimatedChatController extends ChangeNotifier {
  late ProfileModel _profile = profileInit();
  var openChat = ValueNotifier<bool>(false);
  var openProfile = ValueNotifier<bool>(false);

  void isOpenChat(ProfileModel profile) {
    if (_profile.name == profile.name) {
      openChat.value = false;
      openProfile.value = false;
      _profile = profileInit();
    } else {
      openChat.value = true;
      openProfile.value = false;
      _profile = profile;
    }
    notifyListeners();
  }

  void isOpenProfile() {
    openProfile.value = !openProfile.value;
    notifyListeners();
  }

  ProfileModel getProfile() {
    final profile = _profile;
    return profile;
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
