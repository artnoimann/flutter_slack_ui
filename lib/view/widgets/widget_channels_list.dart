import 'package:flutter/material.dart';

ChannelsList(List<String> channelsList) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 20,
    ),
    child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: channelsList.length,
      itemBuilder: (context, index) {
        return Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            '#  ' + channelsList[index] + '_channel',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    ),
  );
}
