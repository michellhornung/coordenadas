import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/exceptions/user_notfound_exception.dart';
import '../../../core/ui/widgets/loader.dart';
import '../../../core/ui/widgets/messages.dart';
import '../../../services/user/user_service.dart';

part 'user_coord_controller.g.dart';

class UserCoordController = _UserCoordControllerBase with _$UserCoordController;

abstract class _UserCoordControllerBase with Store {
  final UserService _userService;

  _UserCoordControllerBase({required UserService userService}) : _userService = userService;

  Future<void> sendCoordinates(String collectTime, String coordinates) async {
    try {
      Loader.show();

      await _userService.sendCoordinates(collectTime, coordinates);

      await Future.delayed(Duration(seconds: 2));

      Loader.hide();

      Messages.info('Dados enviados com sucesso');
    } catch (e) {
      Loader.hide();
      print('Erro ao realizar envio dos dados' + e.toString());
      Messages.alert('Erro ao realizar envio dos dados');
    }
  }
}
