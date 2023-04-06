import 'package:flutter/material.dart';

class FilterModel {
  final String text;
  final IconData icon;
  final int notifications;
  final bool active;

  const FilterModel({
    required this.text,
    required this.icon,
    required this.notifications,
    required this.active,
  });
}
