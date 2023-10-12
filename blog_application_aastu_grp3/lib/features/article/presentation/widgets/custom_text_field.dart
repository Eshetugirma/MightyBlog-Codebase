import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {required this.placeholder, required this.controller, required this.formKey, super.key});
  final String placeholder;
  final TextEditingController controller;
  final formKey;

  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please $placeholder';
        }
        return null;
      },
      onChanged: (value){
        formKey.currentState.validate();
      },
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w300,
          fontSize: 19,
          color: Color(0XFF979EA5),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF7B8BB2)),
        ),
      ),
    );
  }
}
