import 'package:flutter/material.dart';

class CreatePasswordPage extends StatefulWidget {
  const CreatePasswordPage({Key? key}) : super(key: key);

  @override
  _CreatePasswordPageState createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  String? _errorMessage;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _createPassword() {
    // Perform validation
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    // Check if passwords are empty
    if (password.isEmpty || confirmPassword.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter password and confirm password';
      });
      return;
    }

    // Check if passwords match
    if (password != confirmPassword) {
      setState(() {
        _errorMessage = 'Passwords do not match';
      });
      return;
    }

    // Check if password meets criteria
    RegExp uppercaseRegExp = RegExp(r'[A-Z]');
    RegExp digitRegExp = RegExp(r'\d');
    RegExp symbolRegExp = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');

    if (password.length < 8 || password.length > 16) {
      setState(() {
        _errorMessage = 'Password must be between 8 and 16 characters';
      });
      return;
    } else if (!uppercaseRegExp.hasMatch(password)) {
      setState(() {
        _errorMessage = 'Password must contain at least one uppercase letter';
      });
      return;
    } else if (!digitRegExp.hasMatch(password)) {
      setState(() {
        _errorMessage = 'Password must contain at least one digit';
      });
      return;
    } else if (!symbolRegExp.hasMatch(password)) {
      setState(() {
        _errorMessage = 'Password must contain at least one symbol';
      });
      return;
    }

    // Reset error message
    setState(() {
      _errorMessage = null;
    });

    // Proceed with password creation logic
    print('New Password: $password');
  }

  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0), // Add less space only on the left
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_sharp),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Create Password',
              style: TextStyle(

                fontSize: 22,
              ),
            ),
            const SizedBox(height: 8),
            // Password Input
            // Password Input
            TextField(
              controller: _passwordController,
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                hintText: 'Enter New Password',

                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  child: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
// Confirm Password Input
            TextField(
              controller: _confirmPasswordController,
              obscureText: !_confirmPasswordVisible,
              decoration: InputDecoration(
                hintText: 'Confirm Password',
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _confirmPasswordVisible = !_confirmPasswordVisible;
                    });
                  },
                  child: Icon(
                    _confirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
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
            const SizedBox(height: 25),
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
                  onPressed: _createPassword,
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
                    'Submit',
                    style: TextStyle(fontSize: 16),
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

// void main() {
//   runApp(MaterialApp(
//     home: CreatePasswordPage(),
//   ));
// }
