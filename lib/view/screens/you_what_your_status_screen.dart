import 'package:flutter/material.dart';
import 'package:slack_static_ui/view/widgets/widget_last_status.dart';

class WhatYourStatusScreen extends StatelessWidget {
  const WhatYourStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.close, color: Colors.black,),
        ),
        elevation: 0.7,
        title: Text('Set a status', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.done, color: Colors.grey,),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 0, 5),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.tag_faces,
                  color: Colors.grey,
                  size: 27,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'What\'s your status?',
                hintStyle: TextStyle(
                  height: 0.9,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 0,
          ),
          WidgetLastStatus(':clock1:', 'Clear after...', 'Don\'t clear', Icons.close),
          Divider(
            color: Colors.grey,
            height: 0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 20),
            child: Text(
              'Recent',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
          ),
          WidgetLastStatus(':cloud:', 'A little on the flight', '5 hour', Icons.close),
          WidgetLastStatus(':fries:', 'Eating', '1 hour', Icons.close),
          Divider(
            color: Colors.grey,
            height: 0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 20),
            child: Text(
              'For Artur Workspace',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
          ),
          WidgetLastStatus(':iphone:', 'afc', '1 hour', Icons.close),
          WidgetLastStatus(':surfer:', 'On vacation', '2 week', Icons.close),
        ],
      ),
    );
  }
}
