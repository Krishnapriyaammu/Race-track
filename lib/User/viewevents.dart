import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewEvents extends StatefulWidget {
  const ViewEvents({super.key});

  @override
  State<ViewEvents> createState() => _ViewEventsState();
}

class _ViewEventsState extends State<ViewEvents> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
  appBar: AppBar(

    leading: Row(
      children: [
        Icon(Icons.person_outline_sharp,
        size:30,
        ),
        SizedBox(width: 8,),
        Expanded(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: 
            TextFormField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
                    ),)),
        )
      ],
    ),
     
        


  ),
  
  body: 
    Column(
      
      
      children:
     [
      // Padding(
      //   padding: const EdgeInsets.all(20.0),
      //   child: TextFormField(controller: _searchController,decoration: InputDecoration(hintText: 'search',
      //      prefixIcon: Icon(Icons.search),border: OutlineInputBorder(borderRadius: BorderRadius.circular(40))),),
      // ),
      

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
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: CircleAvatar(
                              radius: 15,
                              
                              backgroundImage: AssetImage('images/racing.jpg'),
                            ),
                          ),
                        ),
                        Align(
                           alignment: Alignment.centerRight,
                           child: Padding(
                             padding: const EdgeInsets.only(right: 100),
                             child: Text('Formula Race Test',style: GoogleFonts.getFont('Josefin Sans',textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),),
                           ),
                            
                        ),
                       
                            
                      ],
                            
                    ),
                  ),
               
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // InkWell(onTap: (){

                  // },),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color.fromARGB(255, 154, 153, 151),),
                   
                    child: Column(
                     
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(borderRadius: BorderRadius.circular(50),),
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