import 'dart:io';
import 'package:blog_application_aastu_grp3/features/authentication/data/datasource/auth_local_data_source.dart';
import 'package:blog_application_aastu_grp3/features/profile/presentation/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class UpdateProfilePhotoPage extends StatefulWidget {
  const UpdateProfilePhotoPage({Key? key}) : super(key: key);

  @override
  _UpdateProfilePhotoPageState createState() => _UpdateProfilePhotoPageState();
}

class _UpdateProfilePhotoPageState extends State<UpdateProfilePhotoPage> {
  File? _selectedPhoto;

  Future<void> _selectPhoto() async {
    final pickedPhoto =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedPhoto != null) {
      setState(() {
        _selectedPhoto = File(pickedPhoto.path);
      });
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile Photo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 75,
              backgroundImage:
                  _selectedPhoto != null ? FileImage(_selectedPhoto!) : null,
              child:
                  _selectedPhoto == null ? Icon(Icons.person, size: 75) : null,
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
      ),
    );
  }
}
