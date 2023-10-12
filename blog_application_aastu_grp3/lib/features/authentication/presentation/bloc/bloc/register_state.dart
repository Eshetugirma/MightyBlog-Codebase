part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterSuccess extends RegisterState {}

final class RegisterFailed extends RegisterState {}

final class Registering extends RegisterState {}
