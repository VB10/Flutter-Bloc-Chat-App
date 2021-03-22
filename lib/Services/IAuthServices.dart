abstract class IAuthService {
  Future<String> signUp(String email, String password, String userName);
}
