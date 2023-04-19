import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/filter_model.dart';

List<FilterModel> filtersDataList = [
  const FilterModel(
    text: 'Pinned',
    icon: Icons.mark_email_unread_outlined,
    notifications: 5,
    active: false,
  ),
  const FilterModel(
    text: 'All',
    icon: CustomIcon.chatBoxIcon,
    notifications: 35,
    active: true,
  ),
  const FilterModel(
    text: 'Live Chat',
    icon: CustomIcon.archiveIcon,
    notifications: 2,
    active: false,
  ),
  const FilterModel(
    text: 'Archived',
    icon: CustomIcon.bookmarkIcon,
    notifications: 0,
    active: false,
  ),
  const FilterModel(
    text: 'Brocked',
    icon: CustomIcon.banSignIcon,
    notifications: 0,
    active: false,
  ),
  const FilterModel(
    text: 'Trash',
    icon: CustomIcon.recycleBinLineIcon,
    notifications: 0,
    active: false,
  ),
];
