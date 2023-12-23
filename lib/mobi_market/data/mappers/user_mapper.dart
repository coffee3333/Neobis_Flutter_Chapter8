import 'package:neobis_flutter_chapter8/mobi_market/domain/models/user/user_model.dart';

class UserMapper {
  static User fromApi(String username) {
    return User(username: username);
  }
}
