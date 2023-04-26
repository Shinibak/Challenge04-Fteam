import 'package:challenge04_fteam/src/models/chat_model.dart';
import 'package:challenge04_fteam/src/models/skill_set_model.dart';

class ProfileModel {
  final String avatarImage;
  final String name;
  final String number;
  final bool isMuted;
  final bool isOnline;
  final String status;
  final List<ChatModel> messages;
  final int notifications;
  final List<SkillSetModel> skills;
  final String group;

  ProfileModel( {
    required this.avatarImage,
    required this.name,
    required this.number,
    required this.isMuted,
    required this.messages,
    required this.isOnline,
    required this.status,
    required this.notifications,
    required this.skills,
    required this.group,
  });
}
