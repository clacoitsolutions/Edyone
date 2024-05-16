
import 'package:edyon_project/screen/user_auth/registration_address.dart';
import 'package:edyon_project/screen/user_auth/user_registration.dart';
import 'package:flutter/material.dart';

class EducationDetails extends StatelessWidget {
  const EducationDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Add your navigation logic here to return to the previous page
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RegistrationPage()));

          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Margin around the body
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your details',
              style:
              TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            EducationFormField(),
          ],
        ),
      ),
      bottomNavigationBar: BottomButton(),
    );
  }
}
class BottomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
     // padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddressDetailsPage()),
          );
          // Add your button's onPressed logic here
        },
        child: Container(
          height: 56.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.blue], // Gradient colors
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text(
              'Submit',
              style: TextStyle(color: Colors.white,fontSize: 16.0),
            ),
          ),
        ),
      ),
    );
  }
}



class EducationFormField extends StatefulWidget {
  const EducationFormField({Key? key}) : super(key: key);

  @override
  _EducationFormFieldState createState() => _EducationFormFieldState();
}

class _EducationFormFieldState extends State<EducationFormField> {
  String? _selectedOption1;
  String? _selectedOption2;
  String? _selectedOption3;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: 'State',
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey), // Show underline border bottom
            ),
          ),
          value: _selectedOption1,
          onChanged: (newValue) {
            setState(() {
              _selectedOption1 = newValue;
            });
          },
          items: ['Andhra Pradesh',
            'Arunachal Pradesh',
            'Assam',
          //   'Bihar',
          //   'Chhattisgarh',
          //   'Goa',
          //   'Gujarat',
          //   'Haryana',
          //  ' Himachal Pradesh',
          //   'Jammu and Kashmir',
          //   'Jharkhand',
          //   'Karnataka',
          //   'Kerala',
          //  ' Madhya Pradesh',
          //   'Maharashtra',
          //   'Manipur',
          //   'Meghalaya',
          //   'Mizoram',
          //   'Nagaland',
          //   'Odisha',
          //   'Punjab',
          //   'Rajasthan',
          //   'Sikkim',
          //   'Tamil Nadu',
          //   'Telangana',
          //   'Tripura',
          // '  Uttar Pradesh',
            'Uttarakhand',
          '  West Bengal']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        SizedBox(height: 20.0),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: 'Education Board',
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey), // Show underline border bottom
            ),
          ),
          value: _selectedOption2,
          onChanged: (newValue) {
            setState(() {
              _selectedOption2 = newValue;
            });
          },
          items: ['CBSE', 'ICSE',
              'UP Board '
          ]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        SizedBox(height: 20.0),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: 'Standard / Class',
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey), // Show underline border bottom
            ),
          ),
          value: _selectedOption3,
          onChanged: (newValue) {
            setState(() {
              _selectedOption3 = newValue;
            });
          },
          items: ['4rth', '5th', '6th', '7th',' 8th' ,' 9th' ,' 10th' , '11th' , '12th']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}

