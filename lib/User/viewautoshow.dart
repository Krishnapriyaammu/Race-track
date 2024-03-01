import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewAutoshow extends StatefulWidget {
  const ViewAutoshow({super.key});

  @override
  State<ViewAutoshow> createState() => _ViewAutoshowState();
}

class _ViewAutoshowState extends State<ViewAutoshow> {
    TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Row(
      children: [
        // Icon(Icons.person_outline_sharp,
        // size:30,
        // ),
        SizedBox(width: 8,),
        Expanded(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: 
            TextFormField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                       contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),)
                    ),)),
        
      
      ],
      ),
      ),
     
        


  
  
  body: 
    Column(
      
      
      children:
     [
       Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Auto Shows',
              style: GoogleFonts.nunitoSans(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 243, 53, 53),
              ),
            ),
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
                 
                       
                  ),
               
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // InkWell(onTap: (){

                  // },),
                  Container(
                    decoration: BoxDecoration( color: Color.fromARGB(255, 154, 153, 151),),
                   
                    child: Column(
                     
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ClipRRect(borderRadius: BorderRadius.circular(0),),
                           Image.asset('images/racing.jpg',height: 200,),
                           Text('Houston community'),
                        
                           Text('Since 2001')
                           
                          
                            
                            
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