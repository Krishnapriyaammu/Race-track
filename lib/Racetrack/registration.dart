import 'package:flutter/material.dart';

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
                            child: Text('Name',),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: name,
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
                            child: Text('License',),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: license,
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
                   
                      ElevatedButton(onPressed: (){}, 
                      style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 240, 7, 19))),
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