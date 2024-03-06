import 'package:flutter/material.dart';
import 'package:loginrace/User/viewprofile.dart';

class UserEditProfile extends StatefulWidget {
  const UserEditProfile({Key? key}) : super(key: key);

  @override
  State<UserEditProfile> createState() => _UserEditProfileState();
}

class _UserEditProfileState extends State<UserEditProfile> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    child: Image.asset('images/imaaaa.jpg'),
                    width: 100.0,
                    height: 100.0,
                    margin: EdgeInsets.only(top: 16.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 227, 102, 113),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                _buildTextField('Name', 'Enter your name', TextInputType.text, (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                }),
                SizedBox(height: 16.0),
                _buildTextField('Email', 'Enter your email', TextInputType.emailAddress, (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  // You can add more advanced email validation logic if needed
                  return null;
                }),
                SizedBox(height: 16.0),
                _buildTextField('Phone Number', 'Enter your phone number', TextInputType.phone, (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  // You can add more advanced phone number validation logic if needed
                  return null;
                }),
                SizedBox(height: 16.0),
                _buildTextField('Place', 'Enter your place', TextInputType.text, (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your place';
                  }
                  return null;
                }),
                SizedBox(height: 16.0),
                _buildTextField('Proof', 'Enter your proof', TextInputType.text, (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your proof';
                  }
                  return null;
                }),
                SizedBox(height: 16.0),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Form is valid, proceed with submission
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return Viewprofile();
                          }),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 240, 124, 130)),
                    ),
                    child: Text('SUBMIT', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String labelText, String hintText, TextInputType inputType, String? Function(String?)? validator) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      ),
      keyboardType: inputType,
      validator: validator,
    );
  }
}
