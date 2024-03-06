import 'package:flutter/material.dart';
import 'package:loginrace/Community/commeditprofil.dart';
import 'package:loginrace/Community/communitylogin.dart';

class CommunityRegister extends StatefulWidget {
  const CommunityRegister({super.key});

  @override
  State<CommunityRegister> createState() => _CommunityRegisterState();
}

class _CommunityRegisterState extends State<CommunityRegister> {
  var cmname=TextEditingController();
  var email=TextEditingController();
  var place=TextEditingController();
  var number=TextEditingController();
  var vehicle=TextEditingController();
  var proof=TextEditingController();
  var pass=TextEditingController();
  var confirm=TextEditingController();
  var image=TextEditingController();
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
                              child: Text('Community Name',),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: cmname,
                          validator: (value) {
                            if (value!.isEmpty) {
                        return 'enter community name';
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
                          controller: number,
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
                              child: Text('Total vehicle',),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: vehicle,
                          validator: (value) {
                            if (value!.isEmpty) {
                        return 'enter total vehicles';
                      }
                          },
                          decoration: InputDecoration(hintText: 'Total vehicles',fillColor: Colors.deepOrange[100],filled: true,
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                                         
                        ),),
                          Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Image',),
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
                          decoration: InputDecoration(hintText: 'Image',fillColor: Colors.deepOrange[100],filled: true,
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
                          print(cmname.text);
                          print(email.text);
                          print(place.text);
                          print(number.text);
                          print(proof.text);
                          print(vehicle.text);
                          print(image.text);
                          print(pass.text);
                          print(confirm.text);
                           if (fkey.currentState!.validate()) {
               
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return CommunityLogin();
                    },));
                           }
                        }, 
                        style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 233, 142, 146))),
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