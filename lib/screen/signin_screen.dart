import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist_app/components/my_textformfield.dart';
import 'package:todolist_app/constant/constant.dart';
import 'package:todolist_app/screen/signup_screen.dart';
import '../components/mybutton.dart';
import '../components/myiconbtn.dart';
import 'index_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _showDialog(String txtMsg) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Sign In'),
          content: Text(txtMsg),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const IndexScreen()));
                },
                child: const Text('OK')),
          ],
        );
      },
    );
  }

  void SignInUser() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      _showDialog('Login Successfully !');
    } on FirebaseAuthException {
      _showDialog('Failed to login...');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/pink.jpg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          // Center the container
          child: Container(
            width: 350, // Set the width of the container
            padding:
                const EdgeInsets.all(20.0), // Add padding inside the container
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(
                  0.9), // Set a background color with some transparency
              borderRadius: BorderRadius.circular(15), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Form(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 40, 15, 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Hello, Kitty!',
                        style: textTitle,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Please sign in with your email and password',
                        style: textSubTitle,
                      ),
                      const SizedBox(height: 20),
                      MyTextFormField(
                        controller: emailController,
                        obscureText: false,
                        labelText: 'Email',
                        hintText: 'Enter your email',
                      ),
                      const SizedBox(height: 20),
                      MyTextFormField(
                        controller: passwordController,
                        obscureText: true,
                        labelText: 'Password',
                        hintText: 'Enter your password',
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forgot password?',
                            style: GoogleFonts.lato(
                                fontSize: 16, color: Colors.pink),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      MyButton(
                        onTap: SignInUser,
                        hintText: 'Sign In',
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        children: [
                          Expanded(
                              child: Divider(
                            thickness: 0.8,
                            color: Colors.grey,
                          )),
                          SizedBox(width: 5),
                          Text(
                            'Or continue with',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                              child: Divider(
                            thickness: 0.8,
                            color: Colors.grey,
                          )),
                        ],
                      ),
                      const SizedBox(height: 30),
                       const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyIconBtn(
                        imagePath: 'assets/images/gg_icon.jpg',
                      ),
                      SizedBox(width: 30),
                      MyIconBtn(
                        imagePath: 'assets/images/fb_icon.png',
                      ),
                    ],
                  ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Not a member?',
                              style: TextStyle(color: Colors.grey)),
                          const SizedBox(width: 5),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpScreen()));
                              },
                              child: const Text(
                                'Register now.',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.pink),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
