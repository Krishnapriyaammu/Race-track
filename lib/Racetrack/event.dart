import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loginrace/Racetrack/track.dart';
import 'package:loginrace/Racetrack/uploadeventimage.dart';

class EventAdd extends StatefulWidget {
  const EventAdd({super.key});

  @override
  State<EventAdd> createState() => _EventAddState();
}

class _EventAddState extends State<EventAdd> {
  TextEditingController dateController = TextEditingController();
  var eventname=TextEditingController();
  var owner=TextEditingController();
  var tickets=TextEditingController();
  var price=TextEditingController();

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
             child: Container(
              
              width: 400,
               child: SingleChildScrollView(
                 child: Padding(
                   padding: const EdgeInsets.only(top:20,bottom: 20),
                   child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('EVENTS', style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Event Name',),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: eventname,
                        decoration: InputDecoration(hintText: 'Event Name',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                       
                        ),
                        ),
                        // SizedBox(height: 10,),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Owner',),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: owner,
                        decoration: InputDecoration(hintText: 'Owner',fillColor:  Color.fromARGB(112, 243, 214, 214),filled: true,
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
                      // TextFormField(decoration: InputDecoration(hintText: 'Date',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                      // border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                       
                      // ),),
                   
                        // SizedBox(height: 10,),
                   
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Total Tickets',),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: tickets,
                        decoration: InputDecoration(hintText: 'Total tickets',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                      
                      ),),
                   
                  
                   
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Price',),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: price,
                        decoration: InputDecoration(hintText: 'Price',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                      
                      ),),
                   
                      
                   
                     
                   
                      
                      SizedBox(height: 40,),
                   
                      ElevatedButton(onPressed: (){
                        print(eventname.text);
                        print(owner.text);
                        print(tickets.text);
                        print(price.text);

                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return RaceTrackUploadEventimage();
                  },));
                      }, 
                      style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 65, 144, 173))),
                      child: Text('NEXT',style: TextStyle(color: Colors.white),))
                   
                      
                      
                      
                   
                   
                   
                   
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