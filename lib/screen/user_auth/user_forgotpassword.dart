import 'package:flutter/material.dart';

class forgotpassword extends StatefulWidget {
  const forgotpassword({Key? key}) : super(key: key);

  @override
  _forgotpassword createState() => _forgotpassword();
}

class _forgotpassword extends State<forgotpassword> {
  final TextEditingController _phoneNumberController = TextEditingController();
  String? _errorMessage;

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _sendOTP() {
    // Perform validation
    RegExp regex = RegExp(r'^[6-9]\d{9}$'); // Regular expression for validating 10-digit numbers starting with 6, 7, 8, or 9
    if (_phoneNumberController.text.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter a mobile number';
      });
    } else if (!regex.hasMatch(_phoneNumberController.text)) {
      setState(() {
        _errorMessage = 'Please enter a valid  mobile number';
      });
    } else {
      // Reset error message
      setState(() {
        _errorMessage = null;
      });
      // Proceed with sending OTP
      // Add your logic here
      print('OTP Sent to ${_phoneNumberController.text}');
    }
  }


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
            const SizedBox(height: 20), // Added space between arrow button and text
            const Text(
              'Enter Your Mobile Number',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22, // Set font size to 25
              ),
            ),
            const SizedBox(height: 8), // Added space between first row and second row
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center, // Align items to the center vertically
                      children: [
                        Image.network(
                          'https://png.pngtree.com/png-vector/20220812/ourmid/pngtree-indian-flag-design-png-png-image_6108311.png', // Replace 'https://example.com/your_image.png' with the URL of your online image
                          height: 30,
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ),
                  Container(
                    child: const Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5), // Add space only at the top
                          child: Center(
                            child: Text(
                              '+91',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Center( // Center the text vertically
                          child: Text(
                            '|',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Container(
                      child: TextField(
                        controller: _phoneNumberController,
                        decoration: const InputDecoration(
                          hintText: 'Enter Mobile Number',
                          border: InputBorder.none, // Remove TextField border
                        ),
                      ),
                    ),
                  ),
                ],
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
            SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.pink],
                    stops: [0.0, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: ElevatedButton(
                  onPressed: _sendOTP,
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(15.0)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                    foregroundColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.black54; // Text color when disabled
                      }
                      return Colors.white; // Text color when enabled
                    }),
                  ),
                  child: const Text(
                    'Send OTP',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Already have an account? "),
                Text(
                  'Login',
                  style: TextStyle(color: Colors.purple),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
