import 'package:flutter/material.dart';
import 'package:slack_static_ui/sample_data/users_list.dart';
import 'package:slack_static_ui/view/widgets/widget_jump_to.dart';
import 'package:slack_static_ui/view/widgets/widget_user_avatar_with_status_online.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    JumpTo(true, MediaQuery
                        .of(context)
                        .size
                        .width - 100,
                            () => null),
                    SizedBox(
                      // width: MediaQuery.of(context).size.width * 0.15,
                      height: 40,
                      width: 50,
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop(true);
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 5,
                color: Colors.black45,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 15),
                height: 100,
                child: ListView.builder(
                    itemCount: userList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Column(
                            children: [
                              WidgetUserAvatarWithStatusOnline(
                                userList[index].avatarSrc,
                                userList[index].online,
                                60,
                                60,
                              ),
                              SizedBox(height: 5),
                              SizedBox(
                                width: 50,
                                child: Text(
                                  userList[index].name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(height: 10),
              Divider(
                height: 5,
                color: Colors.black45,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 15,
                  top: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'History',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    ListView.builder(
                        itemCount: userList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.8,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  WidgetUserAvatarWithStatusOnline(
                                    userList[index].avatarSrc,
                                    userList[index].online,
                                    40,
                                    40,
                                  ),
                                  SizedBox(width: 5),
                                  Text(userList[index].name, style: TextStyle(
                                    fontWeight: FontWeight.w600,),),
                                  SizedBox(width: 8),
                                  Text(userList[index].name, style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black54),),
                                ],
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
