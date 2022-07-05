import 'dart:async';

import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:slack_static_ui/controllers/functions.dart';
import 'package:slack_static_ui/view/screens/init_screen.dart';

class PreloaderScreen extends StatefulWidget {
  const PreloaderScreen({Key? key}) : super(key: key);

  @override
  State<PreloaderScreen> createState() => _PreloaderScreenState();
}

class _PreloaderScreenState extends State<PreloaderScreen> {
  bool _isContainerVisible = true;

  void _timer() {
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _isContainerVisible = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _timer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isContainerVisible ? Colors.white : "4B144A".toColor(),
      body: Center(
        child: _isContainerVisible
            ? Container(
                width: 150,
                child: Lottie.asset(
                  'assets/1826-slack-app-loader.json',
                  repeat: false,
                ),
              )
            : Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              'Slack brings the team together, wherever you are',
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(
                              height: 120,
                            ),
                            Entry(
                              delay: Duration(milliseconds: 300),
                              duration: Duration(milliseconds: 300),
                              opacity: 0,
                              yOffset: -1000,
                              curve: Curves.easeInOutCubic,
                              child: Entry(
                                delay: Duration(milliseconds: 450),
                                duration: Duration(milliseconds: 600),
                                curve: Curves.decelerate,
                                scale: 0.5,
                                angle: 1.5707,
                                child: Image.asset(
                                  'assets/slack.png',
                                  width: 150,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Entry(
                                  yOffset: -1000,
                                  scale: 1,
                                  delay: Duration(milliseconds: 100),
                                  duration: Duration(milliseconds: 600),
                                  curve: Curves.decelerate,
                                  child: Image.asset(
                                    'assets/message.png',
                                    width: 60,
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Entry(
                                  yOffset: -1000,
                                  scale: 1,
                                  delay: Duration(milliseconds: 100),
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.decelerate,
                                  child: Image.asset(
                                    'assets/contacts.png',
                                    width: 60,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 15,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: "4383F7".toColor(),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: Icon(
                                          EvaIcons.google,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                      ),
                                      Text(
                                        'Continue with Google',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 19,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 15,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: "03795B".toColor(),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10,),
                                        child: Icon(
                                          Icons.email_outlined,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                      ),
                                      Text(
                                        'Continue with email address',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 19,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 35,
                                ),
                                Text(
                                  'Know you workspace URL?',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 21,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => InitScreen(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 15,
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.black)),
                                    child: Text(
                                      'Sign in with URL',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 19,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            );
                          });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      width: MediaQuery.of(context).size.width * 0.8,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Get started',
                        style: TextStyle(
                          color: "4B144A".toColor(),
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
      ),
    );
  }
}
