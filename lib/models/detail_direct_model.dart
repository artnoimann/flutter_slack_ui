import 'package:slack_static_ui/models/user_model.dart';

class DetailDirectMessages {
  String message;
  String time;
  bool hostSource;
  String? srcImage;

  DetailDirectMessages({
    required this.message,
    required this.time,
    required this.hostSource,
    this.srcImage,
  });
}
