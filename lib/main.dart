import 'package:challenge04_fteam/src/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'src/app_module.dart';

void main() async {
  await Hive.initFlutter();

  // ignore: unused_local_variable
  final box = await Hive.openBox('myBox');

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
