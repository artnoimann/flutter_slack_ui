import 'package:slack_static_ui/view/screens/direct_message_screen.dart';
import 'package:slack_static_ui/view/screens/home_screen.dart';
import 'package:slack_static_ui/view/screens/mentions_screen.dart';
import 'package:slack_static_ui/view/screens/search_screen_navigator.dart';
import 'package:slack_static_ui/view/screens/you_screen.dart';

final routesBottomNavigationBar = [
  HomeScreen(),
  DirectMessageScreen(),
  MentionsScreen(),
  SearchScreenNavigator(),
  YouScreen(),
];
