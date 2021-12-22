import '../../core/exceptions/failure.dart';
import '../../repositories/user/user_repository.dart';
import 'user_service.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;

  UserServiceImpl({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<String> sendCoordinates(String collectTime, String coordinates) async {
    print('collectTime=$collectTime');
    try {
      return await _userRepository.sendCoordinates(collectTime, coordinates);
    } catch (e) {
      print('Erro ao tentar enviar coordenadas' + e.toString());
      throw Failure(message: 'Erro ao tentar enviar coordenadas');
    }
  } //sendCoordinates

}
