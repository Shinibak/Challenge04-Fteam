import 'package:challenge04_fteam/src/models/chat_model.dart';
import 'package:challenge04_fteam/src/models/skill_set_model.dart';
import 'package:flutter/material.dart';
import '../models/profile_model.dart';

List<ProfileModel> profilesDataList = [
  ProfileModel(
    avatarImage: 'assets/avatar/cris.jpg',
    isMuted: true,
    name: 'Cris',
    number: '(15) 99872-4545',
    isOnline: false,
    status: 'potato',
    notifications: 13,
    messages: [
      ChatModel(
        message: ['eae'],
        hour: '14:34',
        sending: true,
        profilePicture: 'my',
      ),
      ChatModel(
        message: ['eae', 'de boa ?'],
        hour: '14:34',
        sending: false,
        profilePicture: 'assets/avatar/cris.jpg',
      ),
      ChatModel(
        message: ['no'],
        hour: '14:34',
        sending: true,
        profilePicture: 'my',
      ),
    ],
    skills: [
      const SkillSetModel(
        skill: 'UI/UX Designer',
        color: Color(0xff6863d8),
      ),
      const SkillSetModel(
        skill: 'Project Manager',
        color: Color(0xff89a2a9),
      ),
      const SkillSetModel(
        skill: 'QA',
        color: Color(0xffa5a69a),
      ),
      const SkillSetModel(
        skill: 'CEO',
        color: Color(0xff89a2a9),
      ),
      const SkillSetModel(
        skill: 'Java Script Developer',
        color: Color(0xff8669ab),
      ),
    ],
    group: 'From Team',
  ),
  ProfileModel(
    avatarImage: 'assets/avatar/john_wick2.jpg',
    isMuted: false,
    name: 'Jonh Wick',
    number: '(15) 99872-4545',
    isOnline: true,
    status: 'Lapis',
    notifications: 1,
    messages: [
      ChatModel(
        message: ['eae'],
        hour: '14:34',
        sending: true,
        profilePicture: 'my',
      ),
      ChatModel(
        message: ['eae', 'de boa ?'],
        hour: '14:34',
        sending: false,
        profilePicture: 'assets/avatar/John_Wick.jpg',
      ),
      ChatModel(
        message: ['sim e tu?'],
        hour: '14:34',
        sending: true,
        profilePicture: 'my',
      ),
    ],
    skills: [
      const SkillSetModel(
        skill: 'pistols',
        color: Color(0xff89a2a9),
      ),
    ],
    group: 'Unread',
  ),
  ProfileModel(
    avatarImage: 'assets/avatar/avatar.png',
    isMuted: false,
    name: 'Jonh',
    number: '(1) 99872-4535',
    isOnline: true,
    status: 'Lapis',
    notifications: 1,
    messages: [],
    skills: [],
    group: '',
  ),
];
