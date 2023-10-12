import 'package:bloc/bloc.dart';
import 'package:blog_application_aastu_grp3/features/authentication/data/datasource/auth_local_data_source.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBlocBloc() : super(AuthBlocInitial()) {

    on<AppStarted>((event, emit) async {
     
      emit(AuthenticationAuthenticating());
      LocalDataSource localDataSource = LocalDataSource();
     
      final token = await localDataSource.readFromStorage("Token");
      print("token");
      print(token);
      if(token != ""){
        emit(AuthenticationAuthenticated());
      }else{
        emit(AuthenticationUnAuthenticated());
      }

      print(state);

    });


  }
}
