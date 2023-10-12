import 'dart:convert';

import 'package:blog_application_aastu_grp3/features/authentication/data/datasource/auth_local_data_source.dart';
import 'package:http/http.dart' as http;

import '../model/profile_model.dart';

abstract class RemoteDataSource {
  Future<ProfileModel> getMe();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  const RemoteDataSourceImpl({required this.client});

  @override
  Future<ProfileModel> getMe() async {


     LocalDataSource localStorage =LocalDataSource();
     var token = await localStorage.readFromStorage("Token");

    // String token =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ZTI3YTZhYjZjYmM2ZjU2ZTNhOGE2NiIsImlhdCI6MTY5MzIzMjI4NSwiZXhwIjoxNjk1ODI0Mjg1fQ.Emb1rHWWzqJ5n22NFc1iBQ0nqu2CTLcZLhyrunT2MZQ";
    final url = Uri.parse('https://blog-api-4z3m.onrender.com/api/v1/user');

    final response = await client.get(
      url,
      headers: {
        'Authorization':
            'Bearer $token', // Include the token in the 'Authorization' header
      },
    );

    final profileData =
        ProfileModel.fromJson(jsonDecode(response.body)['data']);
    return profileData;
  }
}
