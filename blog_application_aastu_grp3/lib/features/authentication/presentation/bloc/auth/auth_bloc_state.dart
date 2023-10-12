part of 'auth_bloc_bloc.dart';

sealed class AuthBlocState extends Equatable {
  const AuthBlocState();
  
  @override
  List<Object> get props => [];
}

final class AuthBlocInitial extends AuthBlocState {}

class AuthenticationAuthenticating extends AuthBlocState {}

class AuthenticationAuthenticated extends AuthBlocState {}

class AuthenticationUnAuthenticated extends AuthBlocState {}


