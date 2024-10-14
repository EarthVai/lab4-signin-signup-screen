import 'package:flutter/material.dart';
import 'package:todolist_app/components/my_textfield.dart';
import 'package:todolist_app/components/mybutton.dart';
import 'package:todolist_app/constant/constant.dart';
import 'package:todolist_app/screen/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final re_passwordController = TextEditingController();

  void _showDialog(String txtMsg) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.amber[100],
          title: const Text('Sign Up'),
          content: Text(txtMsg),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      _showDialog('Go Go !');
    } on FirebaseAuthException {
      _showDialog('แก้ไม่ได้จริงๆจาร');
      //_showDialog('Failed to create account !');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pink.jpg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: 350, // Set a fixed width for the container
            padding: const EdgeInsets.all(20.0), // Padding for inner spacing
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9), // Slightly transparent background
              borderRadius: BorderRadius.circular(15), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min, // Adjust container size to its content
                children: [
                  Text(
                    'Welcome to My World',
                    style: textTitle,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'To get started, please create account!',
                    style: textSubTitle,
                  ),
                  const SizedBox(height: 30),
                  MyTextField(
                    controller: usernameController,
                    hintText: 'Enter your name',
                    obscureText: false,
                    labelText: 'Name',
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    controller: emailController,
                    hintText: 'Enter your Email',
                    obscureText: false,
                    labelText: 'Email',
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Enter Password',
                    obscureText: true,
                    labelText: 'Password',
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    controller: re_passwordController,
                    hintText: 'Confirm your password',
                    obscureText: true,
                    labelText: 'Re-password',
                  ),
                  const SizedBox(height: 20),
                  MyButton(onTap: signUp, hintText: 'Go Go Go'),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Oh, already had an account?',
                          style: TextStyle(color: Colors.grey)),
                      const SizedBox(width: 5),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const SignInScreen()));
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.pink),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
