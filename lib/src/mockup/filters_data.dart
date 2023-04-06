import 'package:design_system/design_system.dart';
import '../models/filter_model.dart';

List<FilterModel> filtersDataList = [
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
    text: 'Live blocked',
    icon: CustomIcon.bookmarkIcon,
    notifications: 33,
    active: false,
  ),
];
