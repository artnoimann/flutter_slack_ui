import 'package:flutter/material.dart';
import 'package:slack_static_ui/controllers/functions.dart';
import 'package:slack_static_ui/view/screens/new_message_screen.dart';
import 'package:slack_static_ui/view/screens/search_screen.dart';
import 'package:slack_static_ui/sample_data/users_list.dart';
import 'package:slack_static_ui/view/widgets/widget_jump_to.dart';
import 'package:slack_static_ui/view/widgets/widget_user_avatar_with_status_online.dart';

class DirectMessageScreen extends StatefulWidget {
  const DirectMessageScreen({Key? key}) : super(key: key);

  @override
  State<DirectMessageScreen> createState() => _DirectMessageScreenState();
}

class _DirectMessageScreenState extends State<DirectMessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: "4B144A".toColor(),
        automaticallyImplyLeading: false,
        title: Text(
          'Direct Messages',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            JumpTo(false, MediaQuery.of(context).size.width - 40, () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              );
            }),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: WidgetUserAvatarWithStatusOnline(
                      userList[index].avatarSrc,
                      userList[index].online,
                      40,
                      40,
                    ),
                    title: Text(
                      userList[index].name,
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    subtitle: (userList[index].userMessage.message != null)
                        ? Text(userList[index].userMessage.message!)
                        : Text(''),
                    trailing: Text(
                      userList[index].userMessage.timeAgo,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NewMessageScreen(),
            ),
          );
        },
        backgroundColor: "4B144A".toColor(),
        child: Icon(Icons.add_circle_outline),
      ),
    );
  }
}
