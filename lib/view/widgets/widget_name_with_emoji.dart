import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

WidgetUserNameEmoji(String name, String? emoji) {
  var parser = EmojiParser();

  return RichText(
    text: TextSpan(
      text: name,
      style: TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
      children: [
        (emoji != null)
            ?
        WidgetSpan(
          child: Transform.translate(
            offset: const Offset(10.0,-5.0),
            child: Text(
              parser.emojify(emoji).toString(),
              style: TextStyle(fontSize: 16),
            ),
          ),
        )
            : TextSpan(text: ''),
      ],
    ),
  );
}