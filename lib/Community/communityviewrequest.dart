import 'package:flutter/material.dart';

class CommunityViewRequest extends StatefulWidget {
  const CommunityViewRequest({super.key});

  @override
  State<CommunityViewRequest> createState() => _CommunityViewRequestState();
}

class _CommunityViewRequestState extends State<CommunityViewRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 235, 142, 148),
      

 body: 
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      
      
      children:
     [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: CircleAvatar(radius: 40,
                                    
                                    backgroundImage: AssetImage('images/imaaaa.jpg'),),
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
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color.fromARGB(255, 248, 213, 213),),
                     
                     
                    
                       child:      Column(
                             
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               SizedBox(height: 20,width: 20,),
                                   Text('AWH ENGINEERING COLLEGE'),
                                   Row(
                                     children: [
                                      
                                       Text('KUTTIKATTOOR'),
                                       
                                     ],
                                   ),
                                   Row(
                                     children: [
                                      
                                       Text('09-12-2029')
                                     ],
                                   ),
                                    Row(
                                     children: [
                                      
                                       Text('9.A.M')
                                     ],
                                   ),
                                    Row(
                                     children: [
                                      
                                       Text('Total Hours-4Hrs')
                                     ],
                                   )
                                   
                                  
                                    
                                    
                            ],),
              ),
                        ),
                ]
                    ),
                ]
                  
                  // SizedBox(height: 400,),
             ),
              );
          },
              ),
           ),
            
     ],
       
          
         
        
        ),
    );
  }
    
    
    
    
  }







     

    