import 'package:neobis_flutter_chapter8/domain/models/user/user_model.dart';

class UserMapper {
  static User fromApi(String username) {
    return User(username: username);
  }
}
