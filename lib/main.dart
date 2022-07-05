import 'package:flutter/material.dart';
import 'package:slack_static_ui/preloader_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Slack ui template',
        home: PreloaderScreen()
    );
  }
}
