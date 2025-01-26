import 'package:ecom/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> login(String email, String password);
}
