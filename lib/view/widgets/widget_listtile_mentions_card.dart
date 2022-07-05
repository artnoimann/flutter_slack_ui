import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:slack_static_ui/models/mentions_model.dart';
import 'package:slack_static_ui/view/widgets/widget_user_avatar_with_status_online.dart';

WidgetListTileMentionCard(MentionModel mentionElement, int index) {
  var parser = EmojiParser();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: mentionElement.user.name,
                style: TextStyle(color: Colors.black54),
                children: [
                  TextSpan(
                    text: ' reacted ',
                  ),
                  TextSpan(
                    text: 'you in ',
                  ),
                  TextSpan(
                    text: '#day_channel',
                    style: TextStyle(
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Text(
              mentionElement.user.userMessage.timeAgo,
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
      ListTile(
        leading: (mentionElement.emoji == null)
            ? WidgetUserAvatarWithStatusOnline(
            mentionElement.user.avatarSrc,
            mentionElement.user.online,
            40,
            40)
            : Text(
          parser
              .emojify(mentionElement.emoji!)
              .toString(),
          style: TextStyle(fontSize: 30),
        ),
        title: Text(
          mentionElement.user.name,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: RichText(
          text: TextSpan(
            text: mentionElement
                .user
                .userMessage
                .message! +
                '\n\n',
            style: TextStyle(color: Colors.black87),
            children: [
              (mentionElement.emoji == null)
                  ? WidgetSpan(child: SizedBox())
                  : WidgetSpan(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius:
                    BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: parser
                          .emojify(mentionElement
                          .emoji!)
                          .toString(),
                      style: TextStyle(
                        fontSize: 19,
                      ),
                      children: [
                        WidgetSpan(
                          child: Transform.translate(
                            offset: const Offset(0.0, -2.0),
                            child: Text(
                                ' '+(index+1).toString(),
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight:
                                  FontWeight.w600,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                  width: 50,
                  height: 30,
                ),
              )
            ],
          ),
        ),
      ),
      Divider(height: 15),
    ],
  );;
}