
import 'package:blog_application_aastu_grp3/features/authentication/data/datasource/auth_local_data_source.dart';
import 'package:blog_application_aastu_grp3/features/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:blog_application_aastu_grp3/features/authentication/domain/entity/User.dart';
import 'package:blog_application_aastu_grp3/features/authentication/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSource remoteDataSource;
  final LocalDataSource localData;

  AuthRepositoryImpl(this.remoteDataSource, this.localData);

  @override
  Future<void> login(String email, String password) async {
    print("repo");
    final token = await remoteDataSource.login(email, password);
    await localData.writeToStorage("Token", token);
  }

  @override
  Future<bool> register(User user) async{
    bool incoming = await remoteDataSource.register(user);
    if(incoming){
      return true;
    }
    return false;
  } 
}