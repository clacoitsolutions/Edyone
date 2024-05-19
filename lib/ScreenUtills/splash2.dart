import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:async';

import '../screen/user_auth/user_registration.dart';
import '../screen/user_auth/user_signin.dart';

class SplashScreens extends StatefulWidget {
  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  final PageController _pageController = PageController();
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      int nextPage = _pageController.page!.round() + 1;
      if (nextPage == 3) {
        nextPage = 0;
      }
      _pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _skip() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegistrationApp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              SplashScreenContent(
                imagePath: 'assets/images/logo.png',
                title: 'Better way of learning is calling you',
                description: 'Learn from the best teachers of India in a simple and easy way',
              ),
              SplashScreenContent(
                imagePath: 'assets/images/logo2.png',
                title: 'Find yourself by learning whatever you learn',
                description: 'Learn whatever you want to learn with the best content at an affordable price by looking for courses and batches.',
              ),
              SplashScreenContent(
                imagePath: 'assets/images/logo3.png',
                title: 'It’s not just learning, It’s a promise!',
                description: 'We will deliver our best to make you the best and it\'s our promise.',
              ),
            ],
          ),
          Positioned(
            bottom: 250,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: WormEffect(
                  dotWidth: 10.0,
                  dotHeight: 10.0,
                  spacing: 16.0,
                  dotColor: Colors.grey,
                  activeDotColor: Colors.blue,
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: _skip,
              child: Text('Skip', style: TextStyle(fontSize: 18, color: Colors.blue)),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  width: 335,
                  height: 65,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                      stops: [0.0, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegistrationApp()),
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
                      'Register',
                      style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                    ),
                  ),
                ),
                Container(
                  width: 335,
                  height: 65,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                      stops: [0.0, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInPage()),
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
                      'Login',
                      style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SplashScreenContent extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  SplashScreenContent({
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 219,
              height: 187,
            ),
            SizedBox(height: 62),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF9FA3A9), // Updated font color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder for RegisterPage, LoginPage, and SignupPage
class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Center(child: Text("Register Page")),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(child: Text("Login Page")),
    );
  }
}

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Center(child: Text("Sign Up Page")),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SplashScreens(),
  ));
}





// import 'package:flutter/material.dart';
//
//
// class Splash2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/Image/logo.png', // Make sure the logo image is in the assets folder
//               width: 219,
//               height: 187,
//             ),
//             SizedBox(height: 62),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 45.0),
//               child: Text(
//                 'Best Way to learning is calling you!',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 45.0),
//               child: Text(
//                 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nec neque mauris eget.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 15,
//                 ),
//               ),
//             ),
//             SizedBox(height: 18),
//             Container(
//               width: 335,
//               height: 65,
//               margin: EdgeInsets.only(top: 46),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [Color(0xFFA10048), Color(0xFF2300FF)], // Corrected color instantiation
//                   stops: [0.0, 1.0],
//                 ),
//                 borderRadius: BorderRadius.circular(5.0),
//               ),
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Add your button logic here
//                 },
//                 style: ButtonStyle(
//                   padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(15.0)),
//                   shape: MaterialStateProperty.all<OutlinedBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                   ),
//                   backgroundColor: MaterialStateProperty.resolveWith((states) {
//                     if (states.contains(MaterialState.disabled)) {
//                       return Colors.grey; // Silver color when disabled
//                     }
//                     return Colors.transparent; // Transparent background to allow gradient to show
//                   }),
//                   foregroundColor: MaterialStateProperty.resolveWith((states) {
//                     if (states.contains(MaterialState.disabled)) {
//                       return Colors.black54; // Text color when disabled
//                     }
//                     return Colors.white; // Text color when enabled
//                   }),
//                 ),
//                 child: const Text(
//                   'First Button',
//                   style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
//                 ),
//               ),
//             ),
//             SizedBox(height: 26),
//             Container(
//               width: 335,
//               height: 65,
//               margin: EdgeInsets.only(top: 26),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [Color(0xFFA10048), Color(0xFF2300FF)], // Corrected color instantiation
//                   stops: [0.0, 1.0],
//                 ),
//                 borderRadius: BorderRadius.circular(5.0),
//               ),
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Add your button logic here
//                 },
//                 style: ButtonStyle(
//                   padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(15.0)),
//                   shape: MaterialStateProperty.all<OutlinedBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                   ),
//                   backgroundColor: MaterialStateProperty.resolveWith((states) {
//                     if (states.contains(MaterialState.disabled)) {
//                       return Colors.grey; // Silver color when disabled
//                     }
//                     return Colors.transparent; // Transparent background to allow gradient to show
//                   }),
//                   foregroundColor: MaterialStateProperty.resolveWith((states) {
//                     if (states.contains(MaterialState.disabled)) {
//                       return Colors.black54; // Text color when disabled
//                     }
//                     return Colors.white; // Text color when enabled
//                   }),
//                 ),
//                 child: const Text(
//                   'Second Button',
//                   style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// SizedBox(height: 18),
//             Container(
//               width: 335,
//               height: 65,
//               margin: EdgeInsets.only(top: 46),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [Color(0xFFA10048), Color(0xFF2300FF)], // Corrected color instantiation
//                   stops: [0.0, 1.0],
//                 ),
//                 borderRadius: BorderRadius.circular(5.0),
//               ),
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Add your button logic here
//                 },
//                 style: ButtonStyle(
//                   padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(15.0)),
//                   shape: MaterialStateProperty.all<OutlinedBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                   ),
//                   backgroundColor: MaterialStateProperty.resolveWith((states) {
//                     if (states.contains(MaterialState.disabled)) {
//                       return Colors.grey; // Silver color when disabled
//                     }
//                     return Colors.transparent; // Transparent background to allow gradient to show
//                   }),
//                   foregroundColor: MaterialStateProperty.resolveWith((states) {
//                     if (states.contains(MaterialState.disabled)) {
//                       return Colors.black54; // Text color when disabled
//                     }
//                     return Colors.white; // Text color when enabled
//                   }),
//                 ),
//                 child: const Text(
//                   'First Button',
//                   style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
//                 ),
//               ),
//             ),
//             SizedBox(height: 26),
//             Container(
//               width: 335,
//               height: 65,
//               margin: EdgeInsets.only(top: 26),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [Color(0xFFA10048), Color(0xFF2300FF)], // Corrected color instantiation
//                   stops: [0.0, 1.0],
//                 ),
//                 borderRadius: BorderRadius.circular(5.0),
//               ),
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Add your button logic here
//                 },
//                 style: ButtonStyle(
//                   padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(15.0)),
//                   shape: MaterialStateProperty.all<OutlinedBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                   ),
//                   backgroundColor: MaterialStateProperty.resolveWith((states) {
//                     if (states.contains(MaterialState.disabled)) {
//                       return Colors.grey; // Silver color when disabled
//                     }
//                     return Colors.transparent; // Transparent background to allow gradient to show
//                   }),
//                   foregroundColor: MaterialStateProperty.resolveWith((states) {
//                     if (states.contains(MaterialState.disabled)) {
//                       return Colors.black54; // Text color when disabled
//                     }
//                     return Colors.white; // Text color when enabled
//                   }),
//                 ),
//                 child: const Text(
//                   'Second Button',
//                   style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
//                 ),
//               ),
//             ),