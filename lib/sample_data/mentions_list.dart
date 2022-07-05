import 'package:slack_static_ui/models/mentions_model.dart';
import 'package:slack_static_ui/sample_data/users_list.dart';

List<MentionModel> mentionsList = [
  MentionModel(user: userList[0], message: userList[0].userMessage.message!, emoji: ':stuck_out_tongue_winking_eye:'),
  MentionModel(user: userList[1], message: userList[1].userMessage.message!,),
  MentionModel(user: userList[2], message: userList[2].userMessage.message!, emoji: ':kissing_heart:'),
  MentionModel(user: userList[3], message: userList[3].userMessage.message!, emoji: ':laughing:'),
  MentionModel(user: userList[4], message: userList[4].userMessage.message!, emoji: ':ok_hand:'),
];