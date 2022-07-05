import 'package:flutter/material.dart';
import 'package:slack_static_ui/models/user_model.dart';
import 'package:slack_static_ui/sample_data/detail_direct_data.dart';
import 'package:slack_static_ui/sample_data/you_data.dart';
import 'package:slack_static_ui/view/widgets/widget_user_avatar_with_status_online.dart';

class DetailDirectMessagesScreen extends StatefulWidget {
  UserModel otherUser;

  DetailDirectMessagesScreen({Key? key, required this.otherUser})
      : super(key: key);

  @override
  State<DetailDirectMessagesScreen> createState() =>
      _DetailDirectMessagesScreenState();
}

class _DetailDirectMessagesScreenState
    extends State<DetailDirectMessagesScreen> {
  UserModel you = youData;
  late String srcAvatar;
  late String nameAuthor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.7,
        leading: BackButton(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(20)),
            ),
            SizedBox(width: 5),
            Column(
              children: [
                Text(
                  widget.otherUser.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
                Text(
                  'View detail',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          SizedBox(width: 10),
          Icon(
            Icons.headset,
            color: Colors.grey,
          ),
          SizedBox(width: 10),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: SingleChildScrollView(
                child: ListView.builder(
                    itemCount: detailMessages.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      detailMessages[index].hostSource
                          ? srcAvatar = you.avatarSrc
                          : srcAvatar = widget.otherUser.avatarSrc;
                      detailMessages[index].hostSource
                          ? nameAuthor = you.name
                          : nameAuthor = widget.otherUser.name;
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WidgetUserAvatarWithStatusOnline(
                              srcAvatar, true, 40, 40),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: nameAuthor,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: detailMessages[index].time,
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 13,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  detailMessages[index].message,
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                (detailMessages[index].srcImage != null)
                                    ? ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          child: Image.network(
                                            detailMessages[index].srcImage!,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.7,
                                          ),
                                        )
                                    : SizedBox(),
                                SizedBox(height: 15),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text(
                          '+',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400),
                        ),
                        alignment: Alignment.center,
                        width: 35,
                        height: 35,
                        // padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'New message ' + widget.otherUser.name,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.mic_none,
                    color: Colors.black54,
                    size: 19,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
