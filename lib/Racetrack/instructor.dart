import 'package:flutter/material.dart';
import 'package:loginrace/Racetrack/trackdetails.dart';

class Instructor extends StatefulWidget {
  const Instructor({super.key});

  @override
  State<Instructor> createState() => _InstructorState();
}

class _InstructorState extends State<Instructor> {
  var name=TextEditingController();
  var about=TextEditingController();
  var image=TextEditingController();
  var experience=TextEditingController();
      final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(backgroundColor: Color.fromARGB(255, 212, 119, 110),),
      
body: 
        
        SafeArea(
          
  
         child: Center(
           child: Padding(
             padding:  EdgeInsets.all(40.00),
             child: Form(
              key: _formKey,
               child: Container(
                
                
                width: 400,
                 child: SingleChildScrollView(
                   child: Padding(
                     padding: const EdgeInsets.only(top:20,bottom: 20),
                     child: Column(
                      
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('COACH', style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),),
                  
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(' Name',),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: name,
                          validator: (value) 
                            {
                             if (value!.isEmpty) {
                          return 'enter coach name';
                        }
                          },
                          decoration: InputDecoration(labelText: ' Name',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                         
                          ),
                          ),
                         
                     
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('About',),
                            ),
                          ],
                        ),
                       TextFormField(
                        controller: about,
                        validator: (value) 
                          {
                             if (value!.isEmpty) {
                          return 'enter details';
                        }
                        },
                  maxLines: null, // This makes the TextFormField grow dynamically
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    labelText: 'Write something....',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 12.0),
                    border: OutlineInputBorder(),
                  ),
                ),
                     
                          // SizedBox(height: 10,),
                     
                     
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
                          validator: (value) 
                            {
                             if (value!.isEmpty) {
                          return 'upload images';
                        }
                          },
                          decoration: InputDecoration(hintText: 'image',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                         
                        ),),
                     
                          // SizedBox(height: 10,),
                     
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Experience',),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: experience,
                          validator: (value) 
                            {
                             if (value!.isEmpty) {
                          return 'enter experience';
                        }
                          },
                          decoration: InputDecoration(labelText: 'Experience',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                        
                        ),),
                     
                        
                     
                       
                     
                        
                        SizedBox(height: 40,),
                     
                        ElevatedButton(onPressed: (){
                          print(name.text);
                          print(about.text);
                          print(image.text);
                          print(experience.text);
                                          if (_formKey.currentState!.validate()) {

               
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return TrackDetails();
                    },));
                                          }
                        }, 
                        style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 240, 124, 130))),
                        child: Text('SUBMIT',style: TextStyle(color: Colors.white),))
                     
                        
                        
                        
                     
                     
                     
                     
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