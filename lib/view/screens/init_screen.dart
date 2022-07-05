import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:slack_static_ui/controllers/functions.dart';
import 'package:slack_static_ui/sample_data/bottom_bar_navigation.dart';
import 'package:slack_static_ui/view/widgets/widget_drawer.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: WidgetDrawer(),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
        children: routesBottomNavigationBar,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600,),
        onTap: navigationTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 25,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.message_circle_outline, size: 25,),
            label: 'DMs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alternate_email_rounded, size: 25,),
            label: 'Mentions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 25,),
            label: 'Search',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.face_unlock_sharp, size: 25,),
            label: 'You',
          ),
        ],
      ),
    );
  }
}
