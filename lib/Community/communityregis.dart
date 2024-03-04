import 'package:flutter/material.dart';
import 'package:loginrace/Community/commeditprofil.dart';

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
                        controller: number,
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
                        decoration: InputDecoration(hintText: 'Total vehicles',fillColor: Colors.deepOrange[100],filled: true,
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
                        decoration: InputDecoration(hintText: 'confirm password',fillColor: Colors.deepOrange[100],filled: true,
                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                      ),),
                   
                      
                      SizedBox(height: 40,),
                   
                      ElevatedButton(onPressed: (){

                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return Commueditprofile();
                  },));
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
       )










    );
  }
}