import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:slack_static_ui/controllers/functions.dart';
import 'package:slack_static_ui/sample_data/mentions_list.dart';
import 'package:slack_static_ui/view/widgets/widget_listtile_mentions_card.dart';
import 'package:slack_static_ui/view/widgets/widget_user_avatar_with_status_online.dart';

class MentionsScreen extends StatefulWidget {
  const MentionsScreen({Key? key}) : super(key: key);

  @override
  State<MentionsScreen> createState() => _MentionsScreenState();
}

class _MentionsScreenState extends State<MentionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: "4B144A".toColor(),
        automaticallyImplyLeading: false,
        title: Text(
          'Mentions & Reactions',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 15),
              ListView.builder(
                  itemCount: mentionsList.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return WidgetListTileMentionCard(mentionsList[index], index);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
