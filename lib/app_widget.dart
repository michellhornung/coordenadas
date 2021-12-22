import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/ui/ui_config.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/coord/',
      builder: asuka.builder,
      navigatorObservers: [asuka.asukaHeroController],
      title: UiConfig.title,
      theme: UiConfig.theme,
    ).modular();
  }
}
