import 'package:slack_static_ui/models/user_message.dart';

class UserModel {
  String avatarSrc;
  String name;
  bool online;
  String? emojiStatus;
  UserMessageModel userMessage;

  UserModel({
    required this.avatarSrc,
    required this.name,
    required this.online,
    this.emojiStatus,
    required this.userMessage,
  });
}
