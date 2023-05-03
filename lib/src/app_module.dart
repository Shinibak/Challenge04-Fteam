import 'package:challenge04_fteam/src/pages/mobile/home_mobile_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: HomeMobileModule()),
      ];
}
