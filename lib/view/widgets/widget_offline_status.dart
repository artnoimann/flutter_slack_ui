import 'package:flutter/material.dart';

WidgetOfflineStatus() {
  return Positioned(
    right: -2,
    bottom: -2,
    child: Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 0.5,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        // padding: EdgeInsets.all(1),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 2,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
  );
}