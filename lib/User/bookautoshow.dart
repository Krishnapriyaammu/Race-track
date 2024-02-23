import 'package:flutter/material.dart';
import 'package:loginrace/User/instructorbooking.dart';

class AutoshowBooking extends StatefulWidget {
  const AutoshowBooking({super.key});

  @override
  State<AutoshowBooking> createState() => _AutoshowBookingState();
}

class _AutoshowBookingState extends State<AutoshowBooking> {
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
                      Text('BOOK YOUR SHOW', style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),),
                
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('College Name',),
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
                            child: Text('Venue',),
                          ),
                        ],
                      ),
                      TextFormField(decoration: InputDecoration(hintText: 'Venue',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                       
                      ),),
                   
                        // SizedBox(height: 10,),
                   
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Date of show',),
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
                            child: Text('Total vehicles',),
                          ),
                        ],
                      ),
                      TextFormField(decoration: InputDecoration(hintText: 'Total vehicles',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                      
                      ),),
                   
                        Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Total Hours',),
                          ),
                        ],
                      ),
                      TextFormField(decoration: InputDecoration(hintText: 'Total hours',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                      
                      ),),
                   
                     
                   
                      
                      SizedBox(height: 40,),
                   
                      ElevatedButton(onPressed: (){

                         Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return UserInstructorbooking();
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