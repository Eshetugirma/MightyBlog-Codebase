part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterSubmitted extends RegisterEvent{
  final String fullName;
  final String email;
  final String password;
  final String confirm_password;
  final String expertise;
  final String bio;

  const RegisterSubmitted({ required this.fullName,required this.bio, required this.email, required this.password, required this.confirm_password, required this.expertise});
  
}
