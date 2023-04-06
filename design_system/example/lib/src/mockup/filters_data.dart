import 'package:design_system/design_system.dart';
import '../models/filter_modal.dart';

List<FilterModal> filterDataList = [
  const FilterModal(
    text: 'All',
    icon: CustomIcon.chatBoxIcon,
    notifications: 35,
  ),
  const FilterModal(
    text: 'Live Chat',
    icon: CustomIcon.archiveIcon,
    notifications: 2,
  ),
  const FilterModal(
    text: 'Live blocked',
    icon: CustomIcon.bookmarkIcon,
    notifications: 33,
  ),
];
