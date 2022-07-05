import 'package:slack_static_ui/models/user_model.dart';

class MentionModel {
  UserModel user;
  String? emoji;
  String message;

  MentionModel({required this.user, this.emoji, required this.message});
}