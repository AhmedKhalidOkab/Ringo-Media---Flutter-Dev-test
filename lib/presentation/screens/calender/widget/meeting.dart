import 'package:flutter/material.dart';

class Meeting {
  Meeting(
    this.eventName,
    this.from,
    this.to,
    this.background,
    this.backgroundfisrt,
    this.isAllDay,
  );

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  Color backgroundfisrt;
  bool isAllDay;
  // Widget widget;
}
