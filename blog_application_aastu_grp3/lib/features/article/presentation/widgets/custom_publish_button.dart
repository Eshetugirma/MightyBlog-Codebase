import 'package:flutter/material.dart';

class CustomPublishButton extends StatelessWidget {
  const CustomPublishButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF376AED),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(21),
              
            ),
          ),
          child: const Text(
            'Publish',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          onPressed: () {

            // article= ARti('dit',minred: 5, Ima )



          }),
    );
  }
}
