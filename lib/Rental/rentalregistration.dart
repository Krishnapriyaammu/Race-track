import 'package:flutter/material.dart';
import 'package:loginrace/Rental/renteditprofile.dart';

class RentalRegister extends StatefulWidget {
  const RentalRegister({super.key});

  @override
  State<RentalRegister> createState() => _RentalRegisterState();
}

class _RentalRegisterState extends State<RentalRegister> {
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
                      TextFormField(decoration: InputDecoration(hintText: 'Name',fillColor: Colors.deepOrange[100],filled: true,
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
                      TextFormField(decoration: InputDecoration(hintText: 'Email',fillColor: Colors.deepOrange[100],filled: true,
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
                      TextFormField(decoration: InputDecoration(hintText: 'Location',fillColor: Colors.deepOrange[100],filled: true,
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
                      TextFormField(decoration: InputDecoration(hintText: 'Phone number',fillColor: Colors.deepOrange[100],filled: true,
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
                      TextFormField(decoration: InputDecoration(hintText: 'image',fillColor: Colors.deepOrange[100],filled: true,
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
                      TextFormField(decoration: InputDecoration(hintText: 'Proof',fillColor: Colors.deepOrange[100],filled: true,
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
                      TextFormField(decoration: InputDecoration(hintText: 'password',fillColor: Colors.deepOrange[100],filled: true,
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
                      TextFormField(decoration: InputDecoration(hintText: 'confirm password',fillColor: Colors.deepOrange[100],filled: true,
                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                      ),),
                   
                      
                      SizedBox(height: 40,),
                   
                      ElevatedButton(onPressed: (){
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
