import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ViewEvents extends StatefulWidget {
  const ViewEvents({super.key});

  @override
  State<ViewEvents> createState() => _ViewEventsState();
}

class _ViewEventsState extends State<ViewEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
  appBar: AppBar(

  ),
  body: 
    Column(
      
      children:
     [
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextFormField(decoration: InputDecoration(labelText: 'search', border: OutlineInputBorder()),),
      ),

      Expanded(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
           return Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
             
                  width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CircleAvatar(
                            radius: 15,
                            
                            backgroundImage: AssetImage('images/racing.jpg'),
                          ),
                        ),
                        Align(
                           alignment: Alignment.centerRight,
                           child: Padding(
                             padding: const EdgeInsets.only(right: 100),
                             child: Text('Formula Race Test'),
                           ),
                            
                        ),
                       
                            
                      ],
                            
                    ),
                  ),
               
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    color: Color.fromARGB(255, 154, 153, 151),
                    child: Column(
                     
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                           Image.asset('images/racing.jpg',height: 200,),
                           Text('CUIDED DEL MOTOR'),
                           Row(
                             children: [
                               Icon(Icons.calendar_month),
                               Text('3-10-2024'),
             
                             ],
                           ),
                           Row(
                             children: [
                               Icon(Icons.assistant_photo),
                               Text('Tickets available(100)')
                             ],
                           )
                           
                          
                            
                            
                    ],),
                  ),
                  
                  // SizedBox(height: 400,),
                ],
              ),
               ],
              ),
           );
            
          },
       
          
         
        
        ),
      )




    ],),





    );
  }
}