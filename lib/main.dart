
import 'package:edyon_project/user_signin.dart';
import 'package:flutter/material.dart';
import 'create_password.dart';
import 'screen/user_auth/registration_address.dart';
import 'user_forgotpassword.dart';
import 'opt.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, // Disable the debugger
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home:  AddressDetailsPage(),
    );
  }
}
