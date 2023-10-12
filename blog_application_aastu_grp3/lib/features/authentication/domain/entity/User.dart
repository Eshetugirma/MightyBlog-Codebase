import 'package:equatable/equatable.dart';

class User extends Equatable{
   final String fullName;
   final String email;
   final String bio;
   final String password;
   final String expertise;

  User(this.fullName, this.email, this.bio, this.password, this.expertise);
  
  @override
  // TODO: implement props
  List<Object?> get props => [this.fullName, this.email, this.bio, this.password, this.expertise];
}