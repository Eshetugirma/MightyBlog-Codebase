import 'dart:convert';

import 'package:blog_application_aastu_grp3/features/authentication/data/datasource/auth_local_data_source.dart';
import 'package:blog_application_aastu_grp3/features/authentication/data/model/user_data_model.dart';
import 'package:blog_application_aastu_grp3/features/authentication/domain/entity/User.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<String> login(String email, String password);
  Future<bool> register(User user);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  Future<String> login(String email, String password) async {
    String url = "https://blog-api-4z3m.onrender.com/api/v1/user/login";

    final responseData = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}));
    final response = jsonDecode(responseData.body);
    print(response.toString());

    LocalDataSource localDataSource = LocalDataSource();
    // localDataSource.writeToStorage("profileImage", response);

    return response['token'];
  }

  Future<bool> register(User user) async {
    String url = "https://blog-api-4z3m.onrender.com/api/v1/user";
    final dataTobeSent = jsonEncode({
      "bio": user.bio,
      "fullName": user.fullName,
      "email": user.email,
      "password": user.password,
      "expertise": user.expertise
    });
    final responseData = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'}, body: dataTobeSent);
    final response = jsonDecode(responseData.body);
    if (response["success"]) {
      return true;
    } else {
      return false;
    }
  }
}
