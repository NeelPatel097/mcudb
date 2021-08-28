import 'package:http/http.dart';
import 'package:mcuapp/data/core/api_client.dart';
import 'package:mcuapp/data/models/request_token_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<RequestTokenModel> getRequestToken();
  Future<RequestTokenModel> validateWithLogin(Map<String, dynamic> requestBody);
  Future<String> createSession(Map<String, dynamic> requestBody);
}

class AuthenticationRemoteDataSourceImpl extends AuthenticationRemoteDataSource {
  final ApiClient _client;

  AuthenticationRemoteDataSourceImpl(this._client);

  @override
  Future<RequestTokenModel> getRequestToken() async {
    final response = await _client.get('authentication/token/new');
    print(response);
    final requestTokenModel = RequestTokenModel.fromJson(response);
    return requestTokenModel;
  }

  @override
  Future<RequestTokenModel> validateWithLogin(
      Map<String, dynamic> requestBody) async {

  }

  @override
  Future<String> createSession(Map<String, dynamic> requestBody) async {

  }
}