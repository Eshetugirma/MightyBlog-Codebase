// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:blog_application_aastu_grp3/features/authentication/presentation/bloc/bloc/register_bloc.dart';
import 'package:blog_application_aastu_grp3/features/authentication/presentation/widgets/nav_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  final Function toggleAuth;

  const SignUp({
    Key? key,
    required this.toggleAuth,
  }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final expertise = TextEditingController();
  final fullName = TextEditingController();
  final email = TextEditingController();
  final bio = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            widget.toggleAuth();
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Registered , Please login!")));
          } else if (state is RegisterFailed) {
            email.text = "";
            password.text = "";
            confirmPassword.text = "";

            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Failed to Register , Try Again ")));
          }
        },
        builder: (context, state) {
          if (state is RegisterInitial || state is RegisterFailed) {
            return ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 54),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: NavBarImage(),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 800,
                        child: Stack(
                          clipBehavior: Clip.antiAlias,
                          children: [
                            Positioned(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                decoration: ShapeDecoration(
                                    color: Color(0xFF376AED),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(28),
                                        topRight: Radius.circular(28),
                                      ),
                                    ),
                                    shadows: [
                                      BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 22,
                                      ),
                                    ]),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 20,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              6),
                                      child: GestureDetector(
                                        onTap: () {
                                          widget.toggleAuth();
                                        },
                                        child: Text(
                                          "LOGIN",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 0.25),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              height: 1,
                                              fontFamily: 'Urbanist'),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 20,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              6),
                                      child: Text(
                                        "SIGN UP",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            height: 1,
                                            fontFamily: 'Urbanist'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 64,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 1000,
                                decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(28),
                                        topRight: Radius.circular(28),
                                      ),
                                    ),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x194F5B79),
                                        blurRadius: 22,
                                      ),
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 40),
                                      margin: EdgeInsets.only(top: 32),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 12),
                                            child: Text(
                                              'Welcome',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              'provide credentials to signup',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w900,
                                                  color: Color.fromRGBO(
                                                      45, 67, 121, 1)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(40),
                                      // margin: EdgeInsets.only(top: 32),
                                      child: SignupForm(
                                          formkey: _formkey,
                                          username: username,
                                          password: password,
                                          expertise: expertise,
                                          fullName: fullName,
                                          confirmPassword: confirmPassword,
                                          email: email,
                                          bio: bio),
                                    ),
                                    Center(
                                      child: Container(
                                        child: FloatingActionButton.extended(
                                          onPressed: () {
                                            print("here");
                                            if (_formkey.currentState!
                                                .validate()) {
                                              BlocProvider.of<RegisterBloc>(
                                                      context)
                                                  .add(RegisterSubmitted(
                                                fullName: fullName.text,
                                                email: email.text,
                                                bio: bio.text,
                                                password: password.text,
                                                confirm_password:
                                                    confirmPassword.text,
                                                expertise: expertise.text,
                                              ));
                                            }
                                          },
                                          backgroundColor:
                                              Color.fromRGBO(55, 106, 237, 1),
                                          label: Text(
                                            "SIGNUP",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'Urbanist',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          extendedPadding: EdgeInsets.only(
                                              top: 19,
                                              bottom: 19,
                                              right: 124,
                                              left: 124),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 8),
                                              child: GestureDetector(
                                                child: Text(
                                                  "Have an account?",
                                                  style: TextStyle(
                                                    color: Color(0xFF2D4379),
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: GestureDetector(
                                                onTap: () {
                                                  widget.toggleAuth();
                                                },
                                                child: Text(
                                                  "Login",
                                                  style: TextStyle(
                                                    color: Color(0xFF376AED),
                                                    fontSize: 14,
                                                    fontFamily: 'Urbanist',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (state is Registering) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Text(" Unkown Erroor...."),
            );
          }
        },
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  final TextEditingController username;
  final TextEditingController password;
  final TextEditingController confirmPassword;
  final TextEditingController expertise;
  final TextEditingController fullName;
  final TextEditingController email;
  final TextEditingController bio;
  final GlobalKey<FormState> formkey;

  const SignupForm(
      {super.key,
      required this.formkey,
      required this.username,
      required this.password,
      required this.confirmPassword,
      required this.expertise,
      required this.fullName,
      required this.email,
      required this.bio});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool passwordVisible = true;
  String msg = "Show";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formkey,
      child: Column(
        children: [
          TextFormField(
            onChanged: (val) {
              widget.formkey.currentState!.validate();
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Please Enter Your Full Name!";
              } else {
                return null;
              }
            },
            controller: widget.fullName,
            style: TextStyle(
              color: Color(0xFF0D253C),
              fontSize: 16,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
                labelText: 'Full Name',
                labelStyle: TextStyle(
                  color: Color(0xFF2D4379),
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w100,
                )),
          ),
          TextFormField(
            onChanged: (val) {
              widget.formkey.currentState!.validate();
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Please Enter Your Email";
              }
              if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                  .hasMatch(value)) {
                return "Please enter a valid email";
              }
              return null;
            },
            controller: widget.email,
            style: TextStyle(
              color: Color(0xFF0D253C),
              fontSize: 16,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Color(0xFF2D4379),
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w100,
                )),
          ),
          TextFormField(
            onChanged: (val) {
              widget.formkey.currentState!.validate();
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Please Enter Your Expertise!";
              } else {
                return null;
              }
            },
            controller: widget.expertise,
            style: TextStyle(
              color: Color(0xFF0D253C),
              fontSize: 16,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
                labelText: 'Expertise',
                labelStyle: TextStyle(
                  color: Color(0xFF2D4379),
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w100,
                )),
          ),
          TextFormField(
            onChanged: (val) {
              widget.formkey.currentState!.validate();
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Please Enter Your Bio!";
              } else {
                return null;
              }
            },
            controller: widget.bio,
            maxLines: null,
            style: TextStyle(
              color: Color(0xFF0D253C),
              fontSize: 16,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
                labelText: 'Bio',
                labelStyle: TextStyle(
                  color: Color(0xFF2D4379),
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w100,
                )),
          ),
          TextFormField(
            onChanged: (val) {
              widget.formkey.currentState!.validate();
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter a password";
              }
              if (value.length < 6) {
                return "Password length have to be greater than or equal to six!";
              }
              return null;
            },
            obscureText: passwordVisible,
            controller: widget.password,
            style: TextStyle(
              color: Color(0xFF0D253C),
              fontSize: 16,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Color(0xFF2D4379),
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w100,
                ),
                suffix: GestureDetector(
                  child: Text(msg),
                  onTap: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                    if (passwordVisible) {
                      setState(() {
                        msg = "Show";
                      });
                    } else {
                      setState(() {
                        msg = "Hide";
                      });
                    }
                  },
                )),
          ),
          TextFormField(
            onChanged: (val) {
              widget.formkey.currentState!.validate();
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Confirm Your Password!";
              }

              if (widget.password.text != widget.confirmPassword.text) {
                return "Password doesn\'t match";
              }

              return null;
            },
            obscureText: passwordVisible,
            controller: widget.confirmPassword,
            style: TextStyle(
              color: Color(0xFF0D253C),
              fontSize: 16,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
                labelText: 'Confirm Password',
                labelStyle: TextStyle(
                  color: Color(0xFF2D4379),
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w100,
                ),
                suffix: GestureDetector(
                  child: Text(msg),
                  onTap: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                    if (passwordVisible) {
                      setState(() {
                        msg = "Show";
                      });
                    } else {
                      setState(() {
                        msg = "Hide";
                      });
                    }
                  },
                )),
          ),
        ],
      ),
    );
  }
}
