import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:slack_static_ui/controllers/functions.dart';
import 'package:slack_static_ui/sample_data/channels_list.dart';
import 'package:slack_static_ui/sample_data/users_list.dart';
import 'package:slack_static_ui/view/screens/new_message_screen.dart';
import 'package:slack_static_ui/view/screens/search_screen.dart';
import 'package:slack_static_ui/view/screens/threads_screen.dart';
import 'package:slack_static_ui/view/widgets/widget_channels_list.dart';
import 'package:slack_static_ui/view/widgets/widget_jump_to.dart';
import 'package:slack_static_ui/view/widgets/widget_user_list.dart';
import 'dart:math' as math;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ExpandableController _controllerChannels;
  late ExpandableController _controllerStarred;
  late ExpandableController _controllerUsers;

  @override
  void initState() {
    super.initState();
    _controllerChannels = ExpandableController(initialExpanded: true);
    _controllerStarred = ExpandableController(initialExpanded: true);
    _controllerUsers = ExpandableController(initialExpanded: true);
  }

  @override
  void dispose() {
    super.dispose();
    _controllerChannels.dispose();
    _controllerStarred.dispose();
    _controllerUsers.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: "4B144A".toColor(),
        leading: InkWell(
          onTap: () => Scaffold.of(context).openDrawer(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Text(
                  'AN',
                  style: TextStyle(
                    color: "4B144A".toColor(),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        title: Text(
          'Artur Workspace',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          PopupMenuButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              icon: Icon(
                Icons.filter_list,
                color: Colors.white,
              ),
              onSelected: (value) {},
              itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.done,
                                color: Colors.grey,
                                size: 18,
                              ),
                              SizedBox(width: 10),
                              Text('Sections'),
                            ],
                          ),
                          Icon(
                            Icons.list_alt,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 30),
                              Text('Recent Activity'),
                            ],
                          ),
                          Icon(
                            Icons.access_time,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ]),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              JumpTo(false, MediaQuery.of(context).size.width - 40, () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                );
              }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Transform(
                      transform: Matrix4.rotationY(math.pi),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.message_outlined,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ThreadsScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Threads',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                height: 30,
                color: Colors.black45,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Channels',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            '+',
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          SizedBox(width: 15),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _controllerChannels.toggle();
                              });
                            },
                            icon: Icon(
                              _controllerChannels.expanded
                                  ? Icons.keyboard_arrow_down_outlined
                                  : Icons.arrow_forward_ios_outlined,
                              size: _controllerChannels.expanded ? 25 : 17,
                            ),
                            color: Colors.grey.shade500,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expandable(
                controller: _controllerChannels,
                collapsed: SizedBox(),
                expanded: ChannelsList(channelsList),
              ),
              Divider(
                height: 30,
                color: Colors.black45,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Starred',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(width: 15),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _controllerStarred.toggle();
                              });
                            },
                            icon: Icon(
                              _controllerStarred.expanded
                                  ? Icons.keyboard_arrow_down_outlined
                                  : Icons.arrow_forward_ios_outlined,
                              size: _controllerStarred.expanded ? 25 : 17,
                            ),
                            color: Colors.grey.shade500,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ExpandablePanel(
                controller: _controllerStarred,
                collapsed: SizedBox(),
                expanded: ChannelsList(channelsListTwo),
              ),
              Divider(
                height: 30,
                color: Colors.black45,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Direct Messages',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(width: 15),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _controllerUsers.toggle();
                              });
                            },
                            icon: Icon(
                              _controllerUsers.expanded
                                  ? Icons.keyboard_arrow_down_outlined
                                  : Icons.arrow_forward_ios_outlined,
                              size: _controllerUsers.expanded ? 25 : 17,
                            ),
                            color: Colors.grey.shade500,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ExpandablePanel(
                controller: _controllerUsers,
                collapsed: SizedBox(),
                expanded: UsersListAtHomeScreen(userList),
              ),
            ],
          ),
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
