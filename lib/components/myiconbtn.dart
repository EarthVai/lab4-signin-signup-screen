import 'package:flutter/material.dart';

class MyIconBtn extends StatelessWidget {
  final String imagePath;

  const MyIconBtn({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5), // Adjust padding as needed
      decoration: BoxDecoration(
        shape: BoxShape.circle, // Makes the container circular
        //border: Border.all(color: Colors.white),
        color: Colors.transparent, // Make the background transparent
      ),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          height: 50,
          width: 50,
          fit: BoxFit.cover, // Ensure the image fits the circle properly
        ),
      ),
    );
  }
}
