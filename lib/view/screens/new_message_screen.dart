import 'package:flutter/material.dart';
import 'package:slack_static_ui/sample_data/users_list.dart';
import 'package:slack_static_ui/view/widgets/widget_name_with_emoji.dart';
import 'package:slack_static_ui/view/widgets/widget_no_match_user.dart';
import 'package:slack_static_ui/view/widgets/widget_user_avatar_with_status_online.dart';

class NewMessageScreen extends StatefulWidget {
  const NewMessageScreen({Key? key}) : super(key: key);

  @override
  State<NewMessageScreen> createState() => _NewMessageScreenState();
}

class _NewMessageScreenState extends State<NewMessageScreen> {
  late List _foundUsers;

  @override
  void initState() {
    _foundUsers = userList;
    super.initState();
  }

  void _runFilter(String enterFilter) {
    List results = [];

    if (enterFilter.isEmpty) {
      results = userList;
    } else {
      results = userList
          .where((element) =>
              element.name.toLowerCase().contains(enterFilter.toLowerCase()))
          .toList();
    }
    print(enterFilter);
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.7,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'New Message',
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) => _runFilter(value),
            decoration: InputDecoration(
              hintText: 'Search for a channel or conversation',
              hintStyle: TextStyle(fontSize: 17),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: Text(
                  "To:",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black54,
                  ),
                ),
              ),
              prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              filled: true,
              fillColor: Colors.grey.shade50,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.connect_without_contact,
                          color: Colors.blueAccent,
                          size: 27,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'DM someone at another company',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _foundUsers.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: _foundUsers.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: WidgetUserAvatarWithStatusOnline(
                                _foundUsers[index].avatarSrc,
                                _foundUsers[index].online,
                                40,
                                40,
                              ),
                              title: WidgetUserNameEmoji(
                                _foundUsers[index].name,
                                _foundUsers[index].emojiStatus,
                              ),
                              trailing: Checkbox(
                                value: false,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                side: BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                                onChanged: (_) {},
                                tristate: false,
                              ),
                            );
                          },
                        )
                      : WidgetNoMatchUser(40, 40),
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text('+', style: TextStyle(fontSize: 25, color: Colors.grey, fontWeight: FontWeight.w400),),
                        alignment: Alignment.center,
                        width: 35,
                        height: 35,
                        // padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      SizedBox(width: 10,),
                      Text('Write a message', style: TextStyle(color: Colors.grey),),  
                    ],
                  ),
                  Icon(Icons.mic_none, color: Colors.black54, size: 19,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
