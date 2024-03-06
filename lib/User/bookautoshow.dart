import 'package:flutter/material.dart';
import 'package:loginrace/User/autoshowaddpayementdetails.dart';
import 'package:loginrace/User/bookedsuccesfully.dart';
import 'package:loginrace/User/instructorbooking.dart';

class AutoshowBooking extends StatefulWidget {
  const AutoshowBooking({super.key});

  @override
  State<AutoshowBooking> createState() => _AutoshowBookingState();
}

class _AutoshowBookingState extends State<AutoshowBooking> {
   TextEditingController dateController = TextEditingController();
   var clgname=TextEditingController();
   var place=TextEditingController();
   var vehicle=TextEditingController();
   var time= TextEditingController();
   var hours=TextEditingController();
       final fkey = GlobalKey<FormState>();


    DateTime selectedDate = DateTime.now();
get suffixIcon => null;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime ? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = picked.toLocal().toString().split(' ')[0];
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

appBar: AppBar(backgroundColor: Colors.blue),
      
body: 
        
        SafeArea(
          
  
         child: Center(
           child: Padding(
             padding:  EdgeInsets.all(40.00),
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
                        TextFormField(
                          controller: clgname,
                          validator: (value) {
                              if (value!.isEmpty) {
                          return 'enter name';
                        }
                          },
                          decoration: InputDecoration(hintText: ' Name',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                         
                          ),
                          ),
                       
                     
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Venue',),
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
                          decoration: InputDecoration(hintText: 'Venue',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
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
                        GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: TextEditingController(
                              text: "${selectedDate.toLocal()}".split(' ')[0],
                            ),
                            decoration: InputDecoration(
                              hintText: 'Date',
                              fillColor: Color.fromARGB(112, 243, 214, 214),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                      ),
                     
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
                        TextFormField(
                          controller: time,
                          validator: (value) {
                              if (value!.isEmpty) {
                          return 'enter time';
                        }
                          },
                          decoration: InputDecoration(hintText: 'time',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
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
                        TextFormField(
                          controller: vehicle,
                          validator: (value) {
                              if (value!.isEmpty) {
                          return 'enter number of vehicles';
                        }
                          },
                          decoration: InputDecoration(hintText: 'Total vehicles',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
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
                        TextFormField(
                          controller: hours,
                          validator: (value) {
                              if (value!.isEmpty) {
                          return 'enter total hours';
                        }
                          },
                          
                          decoration: InputDecoration(hintText: 'Total hours',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                        
                        ),),
                     
                       
                     
                        
                        SizedBox(height: 40,),
                     
                        ElevatedButton(onPressed: (){
                          print(clgname.text);
                          print(place.text);
                          print(time.text);
                          print(dateController.text);
                          print(hours.text);
                          print(vehicle.text);
                          if (fkey.currentState!.validate()) {
               
                           Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return AutoshowAddPayement();
                    },));
                          }
                        }, 
                        style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                        child: Text('Next',style: TextStyle(color: Colors.white),))
                     
                        
                        
                           
                       
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