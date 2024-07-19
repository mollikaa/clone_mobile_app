import 'package:flutter/material.dart';

class SignInSignUpButtons extends StatelessWidget {
  const SignInSignUpButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            // Sign In button pressed
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, // Set the background color to red
          ),
          child: const Text('Sign In'),
        ),
        ElevatedButton(
          onPressed: () {
            // Sign Up button pressed
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, // Set the background color to red
          ),
          child: const Text('Sign Up'),
        ),
      ],
    );
  }
}
