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

                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return RentalEditprofile();
                  },));
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
       )







    );
  }
}
