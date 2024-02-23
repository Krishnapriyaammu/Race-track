import 'package:flutter/material.dart';
import 'package:loginrace/User/usertrackbooking.dart';

class UserInstructorbooking extends StatefulWidget {
  const UserInstructorbooking({super.key});

  @override
  State<UserInstructorbooking> createState() => _UserInstructorbookingState();
}

class _UserInstructorbookingState extends State<UserInstructorbooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(backgroundColor: Color.fromARGB(255, 212, 119, 110),),
      
body: 
        
        SafeArea(
          
  
         child: Center(
           child: Padding(
             padding:  EdgeInsets.all(40.00),
             child: Container(
              
              
              width: 400,
               child: SingleChildScrollView(
                 child: Padding(
                   padding: const EdgeInsets.only(top:20,bottom: 20),
                   child: Column(
                    
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('BE MY COACH', style: TextStyle(
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
                      TextFormField(decoration: InputDecoration(hintText: ' Name',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                       
                        ),
                        ),
                        // SizedBox(height: 10,),
                      
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.all(10.0),
                      //       child: Text('Owner',),
                      //     ),
                      //   ],
                      // ),
                      // TextFormField(decoration: InputDecoration(hintText: 'Owner',fillColor:  Color.fromARGB(112, 243, 214, 214),filled: true,
                      // border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                      // ),),
                   
                        // SizedBox(height: 10,),
                   
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Age',),
                          ),
                        ],
                      ),
                      TextFormField(decoration: InputDecoration(hintText: 'Age',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                       
                      ),),
                   
                        // SizedBox(height: 10,),
                   
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Date',),
                          ),
                        ],
                      ),
                      TextFormField(decoration: InputDecoration(hintText: 'date',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                      
                      ),),
                   
                        // SizedBox(height: 10,),
                   
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Time',),
                          ),
                        ],
                      ),
                      TextFormField(decoration: InputDecoration(hintText: 'time',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                       
                      ),),
                   
                        // SizedBox(height: 10,),
                   
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Level',),
                          ),
                        ],
                      ),
                      TextFormField(decoration: InputDecoration(hintText: 'Level',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                      
                      ),),
                   
                       
                   
                     
                   
                      
                      SizedBox(height: 40,),
                   
                      ElevatedButton(onPressed: (){

                         Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return UserTrackBooking();
                  },));
                      }, 
                      style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 240, 124, 130))),
                      child: Text('BOOK',style: TextStyle(color: Colors.white),))
                   
                      
                      
                      
                   
                   
                   
                   
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