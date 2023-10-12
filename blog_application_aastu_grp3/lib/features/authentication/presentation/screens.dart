import 'package:blog_application_aastu_grp3/features/authentication/presentation/screens/login_screen.dart';
import 'package:blog_application_aastu_grp3/features/authentication/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class SigninToggle extends StatefulWidget {
  const SigninToggle({super.key});

  @override
  State<SigninToggle> createState() => _SigninToggleState();
}

class _SigninToggleState extends State<SigninToggle> {
  @override
  bool is_login = true;

  void toggleAuth(){
    setState(() {
      is_login = !is_login;
    });
  }

  Widget build(BuildContext context) {
    
    if(is_login){
      return Login(toggleAuth: toggleAuth);
    }else{
      return SignUp(toggleAuth: toggleAuth);
    }
  }
}