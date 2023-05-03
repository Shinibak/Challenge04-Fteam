import 'package:challenge04_fteam/src/pages/mobile/home_page/home_mobile_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'chat_page/chat_page.dart';
import 'profile_page/profile_page.dart';

class HomeMobileModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const MobileHomePage()),
        ChildRoute('/chat', child: (context, args) => const ChatPage()),
        ChildRoute('/profile', child: (context, args) => const ProfilePage()),
      ];
}
