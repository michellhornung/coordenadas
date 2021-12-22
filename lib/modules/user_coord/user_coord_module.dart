import 'package:flutter_modular/flutter_modular.dart';

import 'user_coord_controller.dart';
import 'user_coord_page.dart';

class UserCoordModule extends Module {
  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => UserCoordController(userService: i()))];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const UserCoordPage(),
    ),
  ];
}
