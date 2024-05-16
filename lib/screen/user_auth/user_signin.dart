import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _phoneNumberError;
  String? _passwordError;
  bool _passwordVisible = false;

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() {
    // Reset previous error messages
    setState(() {
      _phoneNumberError = null;
      _passwordError = null;
    });

    // Perform validation
    if (_phoneNumberController.text.isEmpty) {
      setState(() {
        _phoneNumberError = 'Please enter your mobile number';
      });
      return;
    }

    if (_passwordController.text.isEmpty) {
      setState(() {
        _passwordError = 'Please enter your password';
      });
      return;
    }

    // Perform sign-in logic
    // For demonstration, just printing the phone number and password
    print('Signing in with phone number: ${_phoneNumberController.text}');
    print('Password: ${_passwordController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: SingleChildScrollView(
        child:Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Welcome back!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    'Sign in to continue',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              'https://png.pngtree.com/png-vector/20220812/ourmid/pngtree-indian-flag-design-png-png-image_6108311.png',
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
                              padding: const EdgeInsets.only(top: 5),
                              child: Center(
                                child: Text(
                                  '+91',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Center(
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
                            decoration: InputDecoration(
                              hintText: 'Enter Mobile Number',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            if (_phoneNumberError != null)
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 0),
                child: Text(
                  _phoneNumberError!,
                  style: TextStyle(color: Colors.red),
                ),
              ),

            const SizedBox(height: 10), // Add space between phone number and password fields
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _passwordController,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        errorText: _passwordError,
                        border: InputBorder.none,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          child: Icon(
                            _passwordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                if (_phoneNumberError != null || _passwordError != null)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Error:',
                        textAlign: TextAlign.left,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        // Handle Forgot Password Click
                        print('Forgot Password clicked');
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.pink],
                    stops: [0.0, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: ElevatedButton(
                  onPressed: _signIn,
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
                        return Colors.black54;
                      }
                      return Colors.white;
                    }),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Or "),
              ],
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Don't have an account? ",style: TextStyle(color: Colors.black54),),
                Text(
                  'Register',
                  style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
      ),
    );
  }
}
