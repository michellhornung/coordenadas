import '../../core/exceptions/failure.dart';
import '../../core/rest_client/rest_client.dart';
import '../../core/rest_client/rest_client_exception.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RestClient _restClient;

  UserRepositoryImpl({required RestClient restClient}) : _restClient = restClient;

  @override
  Future<String> sendCoordinates(String collectTime, String coordinates) async {
    print('collectTime REPO=$collectTime');
    try {
      final result = await _restClient.unauth().post('/', data: {
        'collectTime': collectTime,
        'coordinates': coordinates,
      });

      return result.data.toString();
    } on RestClientException catch (e) {
      // check if user already exist
      if (e.statusCode == 403) {
        print('problema com relacao a autenticacao' + e.toString());
        throw Failure();
      }

      print('Erro ao enviar dados de coordenada' + e.toString());
      throw Failure(message: 'Erro ao enviar dados de coordenada');
    }
  } // sendCoordinates
}
