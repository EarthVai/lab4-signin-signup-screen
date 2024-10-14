import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final hintText;

  const MyButton({
    super.key,
    required this .onTap,
    required this .hintText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25.0),
        margin: const EdgeInsetsDirectional.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
            color: Colors.pink[200], borderRadius: BorderRadius.circular(18)),
        child: Center(
            child: Text(
          hintText,
          style: GoogleFonts.lato(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
