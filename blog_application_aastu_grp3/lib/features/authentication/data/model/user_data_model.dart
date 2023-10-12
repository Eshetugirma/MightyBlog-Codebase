
import 'package:blog_application_aastu_grp3/features/authentication/domain/entity/UserData.dart';

class UserDataModel extends UserData{
  UserDataModel({
    required super.id, 
    required super.fullName, 
    required super.email, 
    required super.expertise, 
    required super.bio, 
    required super.createdAt, 
    required super.image, 
    required super.imageCloudinaryPublicId, 
    required super.token});


  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      expertise: json['expertise'],
      bio: json['bio'],
      createdAt: json['createdAt'],
      image: json['image'],
      imageCloudinaryPublicId: json['imageCloudinaryPublicId'],
      token: json['token']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email':email,
      'expertise':expertise,
      'bio':bio,
      'createdAt':createdAt,
      'image':image,
      'imageCloudinaryPublicId':imageCloudinaryPublicId,
      'token':token
    };
  }

  
}