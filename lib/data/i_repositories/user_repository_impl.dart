import 'package:ecom/data/models/user_model.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/remote_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteDatasource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserEntity> login(String email, String password) async {
    final model = await remoteDataSource.login(email, password);
    return model.toEntity();
  }
}
