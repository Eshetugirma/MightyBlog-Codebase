import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  const CustomTextArea({required this.placeholder, required this.controller, required this.formKey,super.key});
  final TextEditingController controller;
  final String placeholder;
  final formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if(value!.isEmpty){
            return 'Please enter $placeholder';
          }
          return null;
        },
        onChanged: (value) {
          formKey.currentState.validate();
        },
        maxLines: 13,
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,
            fontSize: 11,
            color: Color(0XFF979EA5),
          ),
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 222, 225, 232),
              ),
              borderRadius: BorderRadius.circular(10)),
          contentPadding: const EdgeInsets.all(20),
        ),
      ),
    );
  }
}
