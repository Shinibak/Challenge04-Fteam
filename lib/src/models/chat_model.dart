class ChatModel {
  final List<String> message;
  final String hour;
  final bool sending;
  final String profilePicture;

  ChatModel({
    required this.message,
    required this.hour,
    required this.sending,
    required this.profilePicture,
  });
}
