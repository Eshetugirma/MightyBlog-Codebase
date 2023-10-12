import 'dart:io';

import 'package:blog_application_aastu_grp3/features/authentication/presentation/bloc/auth/auth_bloc_bloc.dart';
import 'package:blog_application_aastu_grp3/features/authentication/presentation/bloc/login/login_bloc_bloc.dart';
import 'package:blog_application_aastu_grp3/features/profile/presentation/widgets/about_user.dart';
import 'package:blog_application_aastu_grp3/features/profile/presentation/widgets/shimmer_effects.dart';
import 'package:blog_application_aastu_grp3/features/profile/presentation/widgets/update_user_photo.dart';
import 'package:blog_application_aastu_grp3/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import '../../../authentication/data/datasource/auth_local_data_source.dart';
import '../bloc/user_bloc.dart';
import '../widgets/user_posts.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _selectedPhoto;
  bool _uploading = false;
  Future<void> _selectPhoto() async {
    setState(() {
      _uploading = true;
      print('set to true');
    });

    final pickedPhoto =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedPhoto != null) {
      setState(() {
        _selectedPhoto = File(pickedPhoto.path);
        _uploading = false;
      });
    }
    Navigator.of(context).pop();
    showMyDialog(context);
  }

  Future<void> _uploadPhoto() async {
    if (_selectedPhoto != null) {
      LocalDataSource localDataSource = LocalDataSource();
      String token = await localDataSource.readFromStorage("Token");

      try {
        var request = http.MultipartRequest(
          'PUT',
          Uri.parse(
              'https://blog-api-4z3m.onrender.com/api/v1/user/update/image'),
        );

        request.headers.addAll({
          "Authorization": "Bearer $token",
          "Content-type": "multipart/form-data"
        });

        request.files.add(await http.MultipartFile.fromPath(
          'photo',
          _selectedPhoto!.path,
          contentType: MediaType('image', 'jpeg'),
        ));
        // Send the request and handle the response
        var response = await request.send();
        if (response.statusCode == 200) {
          // Photo uploaded successfully
          // Display a success message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Profile photo updated successfully'),
            ),
          );

          context.read<UserBloc>().add(GetUser());

          // After successful upload, you can navigate back to the profile page
          Navigator.pop(context);
          _selectedPhoto = null;
        } else {
          // Handle error case
          // Display an error message based on the response status code
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Failed to update profile photo (${response.statusCode})'),
              backgroundColor: Colors.red,
            ),
          );
          Navigator.pop(context);
          setState(() {
            _selectedPhoto = null;
          });
        }
      } catch (error) {
        // Handle any exceptions that occurred during the API request
        // Display a specific error message based on the encountered exception
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An error occurred: $error'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      // Handle case where no photo is selected
      // Display an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select a photo'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void showMyDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 75,
                  backgroundImage: _selectedPhoto != null
                      ? FileImage(_selectedPhoto!)
                      : null,
                  child: _selectedPhoto == null
                      ? Icon(Icons.person, size: 75)
                      : null,
                ),
                if (_uploading)
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                SizedBox(height: 20),
                if (_selectedPhoto == null)
                  ElevatedButton(
                    onPressed: _selectPhoto,
                    child: Text('Select Photo'),
                  ),
                SizedBox(height: 10),
                if (_selectedPhoto != null)
                  ElevatedButton(
                    onPressed: _uploadPhoto,
                    child: Text('Upload Photo'),
                  ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    print('being rebuild');
    return Scaffold(
      // backgroundColor
      body: BlocConsumer<LoginBlocBloc, LoginBlocState>(
        listener: (context, state) {
          if (state is LoggedOut) {
            context.read<AuthBlocBloc>().add(AppStarted());

            while (Navigator.canPop(context)) {
              Navigator.pop(context);
            }

            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (con) => SecondScreen()));
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * (1 / 7),
                    left: MediaQuery.of(context).size.width * (1 / 10),
                    right: MediaQuery.of(context).size.width * (1 / 10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios),
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'updateProfilePhoto') {
                            showMyDialog(context);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => UpdateProfilePhotoPage(),
                            //   ),
                            // );
                          }

                          if (value == 'logout') {
                            context.read<LoginBlocBloc>().add(Logout());
                          }
                        },
                        itemBuilder: (BuildContext context) => [
                          PopupMenuItem<String>(
                            value: 'updateProfilePhoto',
                            child: Text('Update Profile Photo'),
                          ),
                          PopupMenuItem<String>(
                            value: 'logout',
                            child: Text('Log out '),
                          ),
                        ],
                        child: Icon(
                          Icons.more_horiz,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
                BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is UserLoaded) {
                      return Column(
                        children: [
                          UserDetail(
                            profileModel: state.profileModel,
                          ),
                          const SizedBox(height: 10),
                          UserPost(
                            profileModel: state.profileModel,
                          ),
                        ],
                      );
                    } else {
                      return Center(
                        child: ProfileShimmer(),
                      );
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
