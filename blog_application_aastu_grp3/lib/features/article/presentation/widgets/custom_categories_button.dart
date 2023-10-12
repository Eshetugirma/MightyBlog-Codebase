import 'package:flutter/material.dart';

class CustomCategoriesButton extends StatelessWidget {
  const CustomCategoriesButton({required this.label, super.key});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
      child: Chip(
        label: Text(label),
        labelStyle: const TextStyle(
          color: Colors.blue,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        side: const BorderSide(
          width: 2,
          color: Colors.blue,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(75),
        ),
        deleteIcon: const Icon(
          Icons.close,
          color: Colors.blue,
        ),
        onDeleted: () {
          
        },
      ),
    );
  }
}
