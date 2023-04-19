import 'package:flutter/material.dart';

class MenuButtonModel {
  final IconData icon;
  final String name;
  final bool active;

  const MenuButtonModel({
    required this.icon,
    required this.active,
    required this.name,
  });
}
