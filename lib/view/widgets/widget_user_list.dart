import 'package:flutter/material.dart';
import 'package:slack_static_ui/models/user_model.dart';
import 'package:slack_static_ui/view/screens/detail_direct_messages_screen.dart';
import 'package:slack_static_ui/view/widgets/widget_name_with_emoji.dart';
import 'package:slack_static_ui/view/widgets/widget_user_avatar_with_status_online.dart';

UsersListAtHomeScreen(List<UserModel> usersList) {
  return Container(
    child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: usersList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailDirectMessagesScreen(otherUser: usersList[index]),
              ),
            );
          },
          child: ListTile(
            leading: WidgetUserAvatarWithStatusOnline(
              usersList[index].avatarSrc,
              usersList[index].online,
              40,
              40,
            ),
            title: WidgetUserNameEmoji(
              usersList[index].name,
              usersList[index].emojiStatus,
            ),
          ),
        );
      },
    ),
  );
}
