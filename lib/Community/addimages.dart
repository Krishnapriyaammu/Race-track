import 'package:flutter/material.dart';

class Communitygallery extends StatefulWidget {
  const Communitygallery({super.key});

  @override
  State<Communitygallery> createState() => _CommunitygalleryState();
}

class _CommunitygalleryState extends State<Communitygallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
  appBar: AppBar(backgroundColor: Color.fromARGB(255, 212, 119, 110),),
      
body: 
      SafeArea(
        
         child: Center(
           child: Padding(
             padding:  EdgeInsets.all(20.00),
             child: Container(
              
              
              width: 400,
               child: SingleChildScrollView(
                 child: Padding(
                   padding: const EdgeInsets.only(top:20,bottom: 20),
                   child: Column(
                    
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('GALLERY', style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),),
              TextFormField(
                maxLines: null, // This makes the TextFormField grow dynamically
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: 'Add image',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 12.0),
                  border: OutlineInputBorder(),
                ),
              ),
               SizedBox(height: 40,),
                   
                      ElevatedButton(onPressed: (){

                  //       Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //           return RatingScreen();
                  // },));
                      }, 
                      style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 240, 124, 130))),
                      child: Text('DONE',style: TextStyle(color: Colors.white),))
      
                   
                   
                   
                    ]
      
      )
                 )
               )
             )
           )
         )
      )
     




    );
  }
}