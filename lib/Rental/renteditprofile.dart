import 'package:flutter/material.dart';
import 'package:loginrace/Rental/rentalviewprofile.dart';

class RentalEditprofile extends StatefulWidget {
  const RentalEditprofile({Key? key}) : super(key: key);

  @override
  State<RentalEditprofile> createState() => _RentalEditprofileState();
}

class _RentalEditprofileState extends State<RentalEditprofile> {
  var user = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var place = TextEditingController();
  var proof = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              setState(() {});
            },
          ),
        ],
      ),
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
                _buildTextField('Name', user, 'Enter your name', TextInputType.text),
                SizedBox(height: 16.0),
                _buildTextField('Email', email, 'Enter your email', TextInputType.emailAddress),
                SizedBox(height: 16.0),
                _buildTextField('Phone Number', phone, 'Enter your phone number', TextInputType.phone),
                SizedBox(height: 16.0),
                _buildTextField('Place', place, 'Enter your place', TextInputType.text),
                SizedBox(height: 16.0),
                _buildTextField('Proof', proof, 'Enter your proof', TextInputType.text),
                SizedBox(height: 16.0),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print(user.text);
                        print(email.text);
                        print(phone.text);
                        print(place.text);
                        print(proof.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return RentViewProfile();
                          }),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 240, 124, 130)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text('SUBMIT', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, String hintText, TextInputType inputType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            fillColor: Color.fromARGB(112, 243, 214, 214),
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          ),
          keyboardType: inputType,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $label';
            }
            return null;
          },
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
