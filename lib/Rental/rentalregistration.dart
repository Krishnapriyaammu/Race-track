import 'package:flutter/material.dart';
import 'package:loginrace/Rental/renteditprofile.dart';

class RentalRegister extends StatefulWidget {
  const RentalRegister({super.key});

  @override
  State<RentalRegister> createState() => _RentalRegisterState();
}

class _RentalRegisterState extends State<RentalRegister> {
  var user=TextEditingController();
  var email=TextEditingController();
  var phone=TextEditingController();
  var image=TextEditingController();
  var place=TextEditingController();
  var proof=TextEditingController();
  var pass=TextEditingController();
  var confpass=TextEditingController();
    final fkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:SafeArea(
         child: Center(
           child: Padding(
             padding:  EdgeInsets.all(20.0),
             child: Container(
              
              width: 400,
               child: SingleChildScrollView(
                 child: Padding(
                   padding: const EdgeInsets.only(top:20,bottom: 20),
                   child: Form(
                    key: fkey,
                     child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('SIGN UP',style: TextStyle(fontWeight: FontWeight.bold),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Name',),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: user,
                          validator: (value) {
                            if (value!.isEmpty) {
                        return 'enter username';
                      }
                          },
                          
                          decoration: InputDecoration(hintText: 'Name',fillColor: Colors.deepOrange[100],filled: true,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                                         
                          ),
                          ),
                          // SizedBox(height: 10,),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Email',),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: email,
                          validator: (value) {
                            if (value!.isEmpty) {
                        return 'enter email';
                      }
                          },
                          decoration: InputDecoration(hintText: 'Email',fillColor: Colors.deepOrange[100],filled: true,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                        ),),
                     
                          // SizedBox(height: 10,),
                     
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Location',),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: place,
                          validator: (value) {
                            if (value!.isEmpty) {
                        return 'enter location';
                      }
                          },
                          decoration: InputDecoration(hintText: 'Location',fillColor: Colors.deepOrange[100],filled: true,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                                         
                        ),),
                     
                          // SizedBox(height: 10,),
                     
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Phone Number',),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                        return 'enter phone';
                      }
                          },
                          decoration: InputDecoration(hintText: 'Phone number',fillColor: Colors.deepOrange[100],filled: true,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                        
                        ),),
                     
                          // SizedBox(height: 10,),
                     
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Upload Image',),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: image,
                          validator: (value) {
                            if (value!.isEmpty) {
                        return 'upload image';
                      }
                          },
                          decoration: InputDecoration(hintText: 'image',fillColor: Colors.deepOrange[100],filled: true,
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                                         
                        ),),
                     
                          // SizedBox(height: 10,),
                     
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Proof',),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: proof,
                          validator: (value) {
                            if (value!.isEmpty) {
                        return 'upload proof';
                      }
                          },
                          decoration: InputDecoration(hintText: 'Proof',fillColor: Colors.deepOrange[100],filled: true,
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                        
                        ),),
                     
                          // SizedBox(height: 10,),
                     
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Password',),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: pass,
                          validator: (value) {
                            if (value!.isEmpty) {
                        return 'enter password';
                      }
                          },
                          decoration: InputDecoration(hintText: 'password',fillColor: Colors.deepOrange[100],filled: true,
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                                         
                        ),),
                          // SizedBox(height: 10,),
                     
                     
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Confirm Password',),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: confpass,
                          validator: (value) {
                            if (value!.isEmpty) {
                        return 'enter confirm pasword';
                      }
                          },
                          decoration: InputDecoration(hintText: 'confirm password',fillColor: Colors.deepOrange[100],filled: true,
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                        ),),
                     
                        
                        SizedBox(height: 40,),
                     
                        ElevatedButton(onPressed: (){
                          print(user.text);
                          print(email.text);
                          print(phone.text);
                          print(proof.text);
                          print(place.text);
                          print(pass.text);
                          print(confpass.text);
                           if (fkey.currentState!.validate()) {
                     
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return RentalEditprofile();
                                       },));
                        }
                        },
                     
                        
                        style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 237, 142, 146))),
                        child: Text('SIGN UP'))
                     
                        
                        
                        
                     
                     
                     
                     
                      ],
                     ),
                   ),
                 ),
               ),
             ),
           ),
         ),
       )







    );
  }
}
