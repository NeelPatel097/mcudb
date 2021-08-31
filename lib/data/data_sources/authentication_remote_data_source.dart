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
    final response = await _client.post(
      'authentication/token/validate_with_login',
      params: requestBody,
    );
    print(response);
    return RequestTokenModel.fromJson(response);
  }

  @override
  Future<String> createSession(Map<String, dynamic> requestBody) async {
    final response = await _client.post(
      'authentication/session/new',
      params: requestBody,
    );
    print(response);
    return response['success'] ? response['session_id'] : null;
  }
}