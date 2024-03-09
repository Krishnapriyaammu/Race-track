import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loginrace/User/payemettype.dart';

class AutoshowAddPayement extends StatefulWidget {
  const AutoshowAddPayement({super.key});

  @override
  State<AutoshowAddPayement> createState() => _AutoshowAddPayementState();
}

class _AutoshowAddPayementState extends State<AutoshowAddPayement> {
    TextEditingController dateController = TextEditingController();
     var name= TextEditingController();
        var  number=TextEditingController();
        var email= TextEditingController();
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


appBar: AppBar(backgroundColor: Colors.blue,),
      
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
                              return 'Enter name';
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
                              child: Text('phone number',),
                            ),
                          ],
                        ),
                        TextFormField(controller: number,
                         validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter phone number';
                            }
                          },
                          decoration: InputDecoration(hintText: 'phone number',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                        
                        ),),
                     
                          // SizedBox(height: 10,),
                     
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(' Email',),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: email,
                           validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter email';
                            }
                          },
                          decoration: InputDecoration(hintText: 'email',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                         
                        ),),
                     
                          // SizedBox(height: 10,),
                     
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Amount',),
                            ),
                          ],
                        ),
                        TextFormField(decoration: InputDecoration(hintText: 'amount',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                        
                        ),),
                         Row(
                         
                          children: [
                             
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: TextFormField(
                                  readOnly: true,
                                  controller: dateController,
                                  decoration: InputDecoration(
                                    hintText: 'Select Date',
                                    fillColor: Color.fromARGB(112, 243, 214, 214),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: () => _selectDate(context),
                            ),
                          
               
                          ],
                        ),
                     
                        
                     
                       
                     
                        
                        SizedBox(height: 40,),
                     
                        ElevatedButton(onPressed: ()
                        async{
                           await FirebaseFirestore.instance.collection("useraddpayementdetails").add({
                       'name':name.text,
                       'number':number.text,
                       'email':email.text,
                       'date':dateController.text,
                            });
                            if (fkey.currentState!.validate()) {
               
                           Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return PayementType();
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