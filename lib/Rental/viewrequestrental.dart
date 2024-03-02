import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewRentRequest extends StatefulWidget {
  const ViewRentRequest({super.key});

  @override
  State<ViewRentRequest> createState() => _ViewRentRequestState();
}

class _ViewRentRequestState extends State<ViewRentRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

 body: 
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      
      
      children:
     [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(radius: 30,
                                  
                                  backgroundImage: AssetImage('images/imaaaa.jpg'),),
        ],
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
             
                height: 20,  width: 300,
                   
                  ),
               
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // InkWell(onTap: (){
             
                  // },),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                     height: 200, width: 300,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color.fromARGB(255, 215, 213, 210),),
                     
                      child: SizedBox(height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 60),
                              child: Image.asset('images/auto2.jfif',height: 130,width: 100,),
                            ),
                            Column(
                             
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               SizedBox(height: 20,width: 20,),
                                   Text('Krishnapriya'),
                                   Row(
                                     children: [
                                      
                                       Text('Chennai'),
                                       
                                     ],
                                   ),
                                   Row(
                                     children: [
                                      
                                       Text('8129724516')
                                     ],
                                   ),
                                    Row(
                                     children: [
                                      
                                       Text('Rent date-08/9/2020')
                                     ],
                                   ),
                                    Row(
                                     children: [
                                      
                                       Text('Due date-10/9/2020')
                                     ],
                                   )
                                   
                                  
                                    
                                    
                            ],),
                          ],
                        ),
                      ),
                    ),
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