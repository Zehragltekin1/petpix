import 'package:flutter/material.dart';
import 'package:petpix/onboardingscreens/fullscreen.dart';
import 'package:petpix/onboardingscreens/pagewiew.dart';
import 'package:petpix/pages/loginscreens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color:Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize:30,
            fontWeight: FontWeight.bold,
            
          )
        )
      
      ),
      
     
     
      home:OnboadingPage() ,
      
      
    );
  
  }
 

}
