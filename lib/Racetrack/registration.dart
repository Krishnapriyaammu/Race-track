import 'package:flutter/material.dart';
import 'package:loginrace/Racetrack/racetracklogin.dart';

class raceRegistration extends StatefulWidget {
  const raceRegistration({super.key});

  @override
  State<raceRegistration> createState() => _raceRegistrationState();
}

class _raceRegistrationState extends State<raceRegistration> {
  var name=TextEditingController();
  var email=TextEditingController();
  var phone=TextEditingController();
  var place=TextEditingController();
  var license=TextEditingController();
  var image=TextEditingController();
  var password=TextEditingController();
  var confirm=TextEditingController();
    final fkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:SafeArea(
         child: Center(
           child: Padding(
             padding:  EdgeInsets.all(20.0),
             child: Form(
              key: fkey,
               child: Container(
                
                width: 400,
                 child: SingleChildScrollView(
                   child: Padding(
                     padding: const EdgeInsets.only(top:20,bottom: 20),
                     child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                          controller: name,
                          validator: (value) {
                             if (value!.isEmpty) {
                        return 'enter username';
                      }
                          },
                          decoration: InputDecoration(hintText: 'Name',fillColor: Color.fromARGB(114, 234, 70, 70),filled: true,
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
                        return 'enter place';
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
                        return 'enter phone number';
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
                              child: Text('License',),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: license,
                          validator: (value) {
                             if (value!.isEmpty) {
                        return 'upload license';
                      }
                          },
                          decoration: InputDecoration(hintText: 'License',fillColor: Colors.deepOrange[100],filled: true,
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                        
                        ),),
                     
                          SizedBox(height: 10,),
                     
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
                          controller: password,
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
                          controller: confirm,
                          validator: (value) {
                             if (value!.isEmpty) {
                        return 'enter confirm password';
                      }
                          },
                          decoration: InputDecoration(hintText: 'confirm password',fillColor: Colors.deepOrange[100],filled: true,
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                        ),),
                     
                        
                        SizedBox(height: 40,),
                     
                        ElevatedButton(onPressed: (){
                          print(name.text);
                          print(email.text);
                          print(phone.text);
                          print(place.text);
                          print(license.text);
                          print(image.text);
                            if (fkey.currentState!.validate()) {
                         
                                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return RacetrackLogin();
                     },));
                         }
                        }, 
                        style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 240, 7, 19))),
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