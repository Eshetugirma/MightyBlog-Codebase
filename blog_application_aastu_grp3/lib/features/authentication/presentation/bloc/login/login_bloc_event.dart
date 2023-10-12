part of 'login_bloc_bloc.dart';

sealed class LoginBlocEvent extends Equatable {
  const LoginBlocEvent();

  @override
  List<Object> get props => [];
}

class LoginFormSubmitted extends LoginBlocEvent {
  final String username;
  final String password;

  LoginFormSubmitted({required this.username, required this.password});
}

class Logout extends LoginBlocEvent {}
