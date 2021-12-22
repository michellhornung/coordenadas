import 'package:flutter_modular/flutter_modular.dart';

import 'core/core_module.dart';
import 'modules/user_coord/user_coord_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<Module> get imports => [CoreModule()];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: UserCoordModule()),
    ModuleRoute('/coord/', module: UserCoordModule()),
  ];
}
