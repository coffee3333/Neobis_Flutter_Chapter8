abstract class RegistrationRepository {
  Future<void> registerUser({
    required String email,
    required String username,
    required String password,
  });

  Future<void> checkUserNameAndMail({
    required String email,
    required String username,
  });
}
