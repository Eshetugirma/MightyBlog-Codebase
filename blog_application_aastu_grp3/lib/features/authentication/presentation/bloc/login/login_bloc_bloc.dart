import 'package:bloc/bloc.dart';
import 'package:blog_application_aastu_grp3/features/authentication/core/usecases/user_login_usecase.dart';
import 'package:blog_application_aastu_grp3/features/authentication/data/datasource/auth_local_data_source.dart';
import 'package:blog_application_aastu_grp3/features/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:blog_application_aastu_grp3/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:blog_application_aastu_grp3/features/authentication/domain/repository/auth_repository.dart';
import 'package:blog_application_aastu_grp3/features/authentication/domain/usecases/login_use_case.dart';
import 'package:blog_application_aastu_grp3/features/authentication/presentation/bloc/auth/auth_bloc_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBlocBloc() : super(LoginBlocInitial()) {
    on<LoginFormSubmitted>((event, emit) async {
      emit(LoginingIn());

      final AuthRemoteDataSource remoteDataSource = AuthRemoteDataSourceImpl();
      final LocalDataSource localData = LocalDataSource();
      final AuthRepository authRepository =
          AuthRepositoryImpl(remoteDataSource, localData);
      final UseCaseLogin loginUseCase =
          LogginUserImpl(repository: authRepository);

      try {
        await loginUseCase.call(event.username, event.password);

        emit(LoginSuccess());
      } catch (e) {
        emit(LoginFailure());
      }
    });

    on<Logout>((event, emit) async {
      emit(LoginingIn());
      LocalDataSource localDataSource = LocalDataSource();
      await localDataSource.deleteFromStorage("Token");
      emit(LoggedOut());
    });
  }
}
