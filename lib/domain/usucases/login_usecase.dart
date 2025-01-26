import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class LoginUseCase {
  final UserRepository repository;

  LoginUseCase(this.repository);

  Future<UserEntity> execute(String email, String password) {
    return repository.login(email, password);
  }
}
