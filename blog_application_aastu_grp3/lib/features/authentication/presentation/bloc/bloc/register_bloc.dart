import 'package:bloc/bloc.dart';
import 'package:blog_application_aastu_grp3/features/authentication/core/usecases/user_login_usecase.dart';
import 'package:blog_application_aastu_grp3/features/authentication/core/usecases/user_register_usecase.dart';
import 'package:blog_application_aastu_grp3/features/authentication/data/datasource/auth_local_data_source.dart';
import 'package:blog_application_aastu_grp3/features/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:blog_application_aastu_grp3/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:blog_application_aastu_grp3/features/authentication/domain/entity/User.dart';
import 'package:blog_application_aastu_grp3/features/authentication/domain/repository/auth_repository.dart';
import 'package:blog_application_aastu_grp3/features/authentication/domain/usecases/register_use_case.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterSubmitted>((event, emit) async {
      emit(Registering());
      final AuthRemoteDataSource remoteDataSource = AuthRemoteDataSourceImpl();
      final LocalDataSource localData = LocalDataSource();
      final AuthRepository authRepository =
          AuthRepositoryImpl(remoteDataSource, localData);
      final UseCaseRegister registerUser =
          RegisterUseCaseImpl(repository: authRepository);

      try {
        bool res = await registerUser.call(User(event.fullName, event.email,
            event.bio, event.password, event.expertise));
        if (res) {
          emit(RegisterSuccess());
        } else {
          emit(RegisterFailed());
        }
      } catch (e) {
        emit(RegisterFailed());
      }
    });
  }
}
