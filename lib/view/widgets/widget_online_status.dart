import 'package:flutter/material.dart';

WidgetOnlineStatus() {
  return Positioned(
    right: -2,
    bottom: -2,
    child: Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(
          width: 4,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );
}