import 'package:flutter/material.dart';

class AddressDetailsPage extends StatefulWidget {
  const AddressDetailsPage({Key? key}) : super(key: key);

  @override
  _AddressDetailsPageState createState() => _AddressDetailsPageState();
}

class _AddressDetailsPageState extends State<AddressDetailsPage> {
  final TextEditingController _floorHouseController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();
  final TextEditingController _zipcodeController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  String? _selectedState;
  String? _selectedCity;
  List<String> _states = ['State 1', 'State 2', 'State 3'];
  List<String> _cities = ['City 1', 'City 2', 'City 3'];
  bool _passwordVisible = false;

  @override
  void dispose() {
    _floorHouseController.dispose();
    _addressController.dispose();
    _landmarkController.dispose();
    _zipcodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle arrow click
                  },
                  child: Icon(Icons.arrow_back_ios_sharp), // Arrow icon
                ),
                GestureDetector(
                  onTap: () {
                    // Handle skip click
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Added space between arrow button and text
            const Text(
              'Enter Your Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22, // Set font size to 25
              ),
            ),
            const SizedBox(height: 10), // Added space between arrow button and text

            TextFormField(
              controller: _floorHouseController,
              decoration: InputDecoration(labelText: 'Floor/House No.'),
            ),
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextFormField(
              controller: _landmarkController,
              decoration: InputDecoration(labelText: 'Landmark'),
            ),
            TextFormField(
              controller: _zipcodeController,
              decoration: InputDecoration(labelText: 'Zipcode'),
            ),
            DropdownButtonFormField<String>(
              value: _selectedState,
              onChanged: (value) {
                setState(() {
                  _selectedState = value;
                });
              },
              items: _states.map((state) {
                return DropdownMenuItem(
                  value: state,
                  child: Text(state),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'State'),
            ),
            DropdownButtonFormField<String>(
              value: _selectedCity,
              onChanged: (value) {
                setState(() {
                  _selectedCity = value;
                });
              },
              items: _cities.map((city) {
                return DropdownMenuItem(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'City'),
            ),
            SizedBox(height: 20),
            // TextFormField(
            //   controller: _passwordController,
            //   obscureText: !_passwordVisible,
            //   decoration: InputDecoration(
            //     labelText: 'Password',
            //     suffixIcon: GestureDetector(
            //       onTap: () {
            //         setState(() {
            //           _passwordVisible = !_passwordVisible;
            //         });
            //       },
            //       child: Icon(
            //         _passwordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
            //         color: Colors.grey,
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(height: 150),
            SizedBox(
              width: 335,
              height: 60,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFA10048), Color(0xFF2300FF)],  // Corrected color instantiation
                    stops: [0.0, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: ElevatedButton(
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
                  onPressed: () {  },
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
