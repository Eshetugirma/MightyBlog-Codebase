import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserData extends Equatable{
  final String id;
  final String fullName;
  final String email;
  final String expertise;
  final String bio;
  final String createdAt;
  final String image;
  final String imageCloudinaryPublicId;
  final String token;

  UserData(
    {
    required this.id, 
    required this.fullName, 
    required this.email, 
    required this.expertise, 
    required this.bio, 
    required this.createdAt, 
    required this.image, 
    required this.imageCloudinaryPublicId, 
    required this.token});
  
  @override
  // TODO: implement props
  List<Object?> get props => [this.id, this.fullName, this.email, this.expertise, this.bio, this.createdAt, this.image, this.imageCloudinaryPublicId, this.token];



}