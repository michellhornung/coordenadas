import 'package:flutter_modular/flutter_modular.dart';

import '../../core/rest_client/dio_rest_client.dart';
import '../../core/rest_client/rest_client.dart';
import '../../repositories/user/user_repository.dart';
import '../../repositories/user/user_repository_impl.dart';
import '../../services/user/user_service.dart';
import '../../services/user/user_service_impl.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<RestClient>((i) => DioRestClient(), export: true),
    Bind.lazySingleton<UserRepository>((i) => UserRepositoryImpl(restClient: i()), export: true),
    Bind.lazySingleton<UserService>((i) => UserServiceImpl(userRepository: i()), export: true),
  ];
}
