import 'package:flutter/material.dart';
import 'package:slack_static_ui/controllers/functions.dart';
import 'package:slack_static_ui/sample_data/you_data.dart';
import 'package:slack_static_ui/view/screens/you_what_your_status_screen.dart';
import 'package:slack_static_ui/view/widgets/widget_search_element.dart';
import 'package:slack_static_ui/view/widgets/widget_user_avatar_with_status_online.dart';

class YouScreen extends StatefulWidget {
  const YouScreen({Key? key}) : super(key: key);

  @override
  State<YouScreen> createState() => _YouScreenState();
}

class _YouScreenState extends State<YouScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: "4B144A".toColor(),
        title: Text(
          'You',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          ListTile(
            leading: WidgetUserAvatarWithStatusOnline(
                youData.avatarSrc, youData.online, 60, 60),
            title: Text(
              youData.name,
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
            ),
            subtitle: youData.online
                ? Text(
                    'Active',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  )
                : Text('Not active',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TextField(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WhatYourStatusScreen(),
                  ),
                );
              },
              keyboardType: TextInputType.none,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.tag_faces,
                  color: Colors.grey,
                  size: 27,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'What\'s your status?',
                hintStyle: TextStyle(
                  height: 0.9,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          WidgetSearchElement(Icons.notifications_off_outlined,
              'Pause notification', Icons.access_time, '  '),
          WidgetSearchElement(Icons.highlight_off, 'Set yourself is away',
              Icons.access_time, '  '),
          Divider(
            color: Colors.grey,
            height: 20,
          ),
          WidgetSearchElement(
              Icons.bookmark_border, 'Saved items', Icons.access_time, '  '),
          WidgetSearchElement(
              Icons.person, 'View profile', Icons.access_time, '  '),
          WidgetSearchElement(
              Icons.phonelink, 'Notification', Icons.access_time, '  '),
          WidgetSearchElement(
              Icons.settings, 'Preference', Icons.access_time, '  '),
        ],
      ),
    );
  }
}
