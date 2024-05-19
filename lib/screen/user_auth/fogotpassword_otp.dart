import 'dart:async';
import 'package:flutter/material.dart';

import 'user_create_password.dart';

class EnterOTPPage extends StatefulWidget {
  const EnterOTPPage({Key? key}) : super(key: key);

  @override
  _EnterOTPPageState createState() => _EnterOTPPageState();
}

class _EnterOTPPageState extends State<EnterOTPPage> {
  final TextEditingController _otpController = TextEditingController();
  String? _errorMessage;

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _verifyOTP() {
    // Perform validation
    if (_otpController.text.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter OTP';
      });
    } else {
      // Reset error message
      setState(() {
        _errorMessage = null;
      });
      // Proceed with verifying OTP
      // Add your logic here
      print('OTP Verified: ${_otpController.text}');
    }
  }

  List<TextEditingController> _otpControllers = List.generate(6, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 30.0), // Added space at the top
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0), // Add less space only on the left
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_sharp),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(height: 25), // Added space between arrow button and text
            const Text(
              'Enter OTP',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                  fontFamily:'Poppins',// Set font size to 25
              ),
            ),
            const SizedBox(height: 0), // Added space between first row and second row
            Row(
              children: List.generate(
                6,
                    (index) => Container(
                  width: 40, // Adjust width of each box as needed
                  height: 40, // Adjust height of each box as needed
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey), // Only bottom border
                    ),
                  ),
                  child: TextField(
                    controller: _otpControllers[index],
                    keyboardType: TextInputType.number,
                    maxLength: 1, // Set maximum length to 1 character
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                    decoration: const InputDecoration(
                      counter: SizedBox.shrink(), // Hide character counter
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      if (value.length > 0) {
                        if (index < 5) {
                          FocusScope.of(context).nextFocus(); // Move focus to the next TextField
                        } else {
                          // Do something when the last box is filled
                        }
                      }
                    },
                  ),
                ),
              ),
            ),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0), // Added padding horizontally
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '60 seconds left',
                    style:TextStyle(fontFamily:'Poppins',
                    fontSize: 12)// Initially showing 60 seconds
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0), // Added padding from the left side
                    child: GestureDetector(
                      onTap: () {
                        // Handle resend OTP
                      },
                      child: Text(
                        'Resend OTP',
                        style: TextStyle(color: Colors.blue,fontSize:16,fontFamily:'Poppins'),
                      ),
                    ),
                  ),

                ],
              ),
            ),

            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFA10048), Color(0xFF2300FF)],  // Corrected color instantiation
                    stops: [0.0, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Call the function to verify OTP
                    _verifyOTP();
                    // Redirect to Create New Password page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreatePasswordPage()),
                    );
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(15.0)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.grey; // Silver color when disabled
                      }
                      return Colors.transparent; // Transparent background to allow gradient to show
                    }),
                    foregroundColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.black54; // Text color when disabled
                      }
                      return Colors.white; // Text color when enabled
                    }),
                  ),
                  child: const Text(
                    'Verify OTP',
                    style: TextStyle(fontSize: 16, fontFamily:'Poppins'),
                  ),
                ),

              ),
            ),


          ],
        ),
      ),
    );
  }
}
