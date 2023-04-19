import 'package:design_system/design_system.dart';
import '../models/menu_button_model.dart';

List<MenuButtonModel> menuButtonsDataList = [
  const MenuButtonModel(
    icon: CustomIcon.blankFileOutlineIcon,
    name: 'Resume',
    active: false,
  ),
  const MenuButtonModel(
    icon: CustomIcon.userPersonaIcon,
    name: 'Contacts',
    active: false,
  ),
  const MenuButtonModel(
    icon: CustomIcon.statisticsChart,
     name: 'Statistic',
    active: false,
  ),
  const MenuButtonModel(
    icon: CustomIcon.chatIcon,
     name: 'Chats',
    active: true,
  ),
  const MenuButtonModel(
    icon: CustomIcon.categoryIcon,
     name: 'Settings',
    active: false,
  ),
];
