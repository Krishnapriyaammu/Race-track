import 'package:flutter/material.dart';

class RentalHome extends StatefulWidget {
  const RentalHome({super.key});

  @override
  State<RentalHome> createState() => _RentalHomeState();
}

class _RentalHomeState extends State<RentalHome> {
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(alignment: Alignment.centerLeft,
          child: 
          CircleAvatar(radius: 30,
                                  
                                  backgroundImage: AssetImage('images/imaaaa.jpg'),),
        ),
        Align(alignment: Alignment.centerRight,
                                     child:   Padding(
                                       padding: const EdgeInsets.only(right: 30),
                                       child: Icon(Icons.notification_add,color: Colors.orange,),
                                     ),
)  ],
      ),
      SizedBox(height: 20,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(alignment: Alignment.centerLeft,
        child:   Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Request'),
            ),
              height: 50,width: 140,color: Color.fromARGB(255, 249, 126, 126),
            ),
        ),),
          Align(alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Accepted'),
              ),
              height: 50,width: 138,color: Color.fromARGB(255, 175, 72, 63),),
          ),
          ),
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
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color.fromARGB(255, 254, 199, 199),),
                     
                      child: SizedBox(height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 60),
                              child: CircleAvatar(radius: 40,backgroundImage: AssetImage('images/imaaaa.jpg'),)
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Column(
                               
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
                            ),
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