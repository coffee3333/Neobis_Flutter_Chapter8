abstract class RegistrationDataSource {
  Future<dynamic> registationUser({
    required String email,
    required String username,
    required String password,
  });
}
