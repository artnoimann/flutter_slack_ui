import 'package:flutter/material.dart';
import 'package:slack_static_ui/view/widgets/widget_offline_status.dart';
import 'package:slack_static_ui/view/widgets/widget_online_status.dart';

WidgetUserAvatarWithStatusOnline(String avatarSrc, bool online, double avatarWidth, double avatarHeight) {
  return Stack(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          avatarSrc,
          width: avatarWidth,
          height: avatarHeight,
          fit: BoxFit.cover,
        ),
      ),
      online
          ? WidgetOnlineStatus()
          : WidgetOfflineStatus(),
    ],
  );
}