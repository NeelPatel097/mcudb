abstract class AuthenticationLocalDataSource {
  Future<void> saveSessionId(String sessionId);
}

class AuthenticationLocalDataSourceImpl extends AuthenticationLocalDataSource {
  @override
  Future<void> saveSessionId(String sessionId) async {
    return await authenticationBox.put('session_id', sessionId);
  }

}