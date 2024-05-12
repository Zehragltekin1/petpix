import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petpix/Components/color.dart';
import 'package:petpix/pages/loginscreens/login_page.dart';

class SignupScreen extends StatefulWidget {
  
  SignupScreen( {super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final email = TextEditingController();
  FocusNode email_F = FocusNode();
  final password = TextEditingController();
  FocusNode password_F = FocusNode();
  final passwordConfirme = TextEditingController();
  FocusNode passwordConfirme_F = FocusNode();
  final username = TextEditingController();
  FocusNode username_F = FocusNode();
  final bio = TextEditingController();
  FocusNode bio_F = FocusNode();
  File? _imageFile;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
    passwordConfirme.dispose();
    username.dispose();
    bio.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: SizedBox(
          width: 105,
          height: 28,
          child: Image.asset('model/assets/petpix.png'),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(width: 96, height: 10),
            Center(
              child: Image.asset('model/assets/Group.png'),
            ),
            SizedBox(width: 50, height: 50),
            InkWell(
              onTap: () async {
              
              },
              child: CircleAvatar(
                radius: 36,
                backgroundColor: Colors.grey,
                child: _imageFile == null
                    ? CircleAvatar(
                        radius: 34,
                        backgroundImage: AssetImage('model/assets/jesse1.jpg'),
                        backgroundColor: Colors.grey.shade200,
                      )
                    : CircleAvatar(
                        radius: 34,
                        backgroundImage: Image.file(
                          _imageFile!,
                          fit: BoxFit.cover,
                        ).image,
                        backgroundColor: Colors.grey.shade200,
                      ),
              ),
            ),
            SizedBox(height: 40),
            Textfild(email, email_F, 'Email', Icons.email),
            SizedBox(height: 15),
            Textfild(username, username_F, 'username', Icons.person),
            SizedBox(height: 15),
            Textfild(bio, bio_F, 'bio', Icons.abc),
            SizedBox(height: 15),
            Textfild(password, password_F, 'Password', Icons.lock),
            SizedBox(height: 15),
            Textfild(passwordConfirme, passwordConfirme_F, 'PasswordConfirme',
                Icons.lock),
            SizedBox(height: 15),
            Signup(),
            SizedBox(height: 15),
            Have()
          ],
        ),
      ),
    );
  }

  Widget Have() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Don you have account?  ",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
              context,
           MaterialPageRoute(builder: (context) => LoginScreen()),
    );
            },
            child: Text(
              "Login ",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget Signup() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () async {
        
        },
        child: InkWell(
          onTap: (){
            Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
          },
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 44,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              'Sign up',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding Textfild(TextEditingController controll, FocusNode focusNode,
      String typename, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: TextField(
          style: TextStyle(fontSize: 18, color: Colors.black),
          controller: controll,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: typename,
            prefixIcon: Icon(
              icon,
              color: focusNode.hasFocus ? primaryColor : Colors.grey[600],
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                width: 2,
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                width: 2,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}