//
// import 'package:edyon_project/screen/user_auth/fogotpassword_otp.dart';
// import 'package:edyon_project/screen/user_auth/user_forgotpassword.dart';
// import 'package:edyon_project/screen/user_auth/user_signin.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
//
//
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     // Setting the status bar color
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: Color(0xFFFFCFEF), // Your color here
//       statusBarBrightness: Brightness.dark, // For iOS (light or dark)
//       statusBarIconBrightness: Brightness.dark, // For Android (light or dark)
//     ));
//
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: forgotpassword(),
//       debugShowCheckedModeBanner: false, // Remove the debug banner
//     );
//   }
// }

import 'package:edyon_project/screen/user_auth/user_signin.dart';
import 'package:flutter/material.dart';
import 'ScreenUtills/splash1.dart';
import 'package:flutter/services.dart';

import 'ScreenUtills/splash2.dart';
import 'screen/user_auth/registration_address.dart';
import 'screen/user_auth/user_education_details.dart';
import 'screen/user_auth/user_registration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Setting the status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFFFFCFEF), // Your color here
      statusBarBrightness: Brightness.dark, // For iOS (light or dark)
      statusBarIconBrightness: Brightness.dark, // For Android (light or dark)
    ));

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: TextTheme(
          // Define Poppins font for the app
          bodyText1: TextStyle(fontFamily: 'Poppins'),
          bodyText2: TextStyle(fontFamily: 'Poppins'),
          headline1: TextStyle(fontFamily: 'Poppins'),
          headline2: TextStyle(fontFamily: 'Poppins'),
          headline3: TextStyle(fontFamily: 'Poppins'),
          headline4: TextStyle(fontFamily: 'Poppins'),
          headline5: TextStyle(fontFamily: 'Poppins'),
          headline6: TextStyle(fontFamily: 'Poppins'),
          subtitle1: TextStyle(fontFamily: 'Poppins'),
          subtitle2: TextStyle(fontFamily: 'Poppins'),
          button: TextStyle(fontFamily: 'Poppins'),
          caption: TextStyle(fontFamily: 'Poppins'),
         // overline: TextStyle(fontFamily: 'Poppins'),
        ),
      ),
      home: MainPage(),
      debugShowCheckedModeBanner: false, // Remove the debug banner
    );
  }
}
