import 'package:flutter/material.dart';
import 'package:loginrace/Rental/uploadrentimage.dart';

class AddrentalProducts extends StatefulWidget {
  const AddrentalProducts({super.key});

  @override
  State<AddrentalProducts> createState() => _AddrentalProductsState();
}

class _AddrentalProductsState extends State<AddrentalProducts> {
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
                      Text('RENTAL PRODUCTS', style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),),
                
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.all(10.0),
                      //       child: Text('Image',),
                      //     ),
                      //   ],
                      // ),
                      // TextFormField(decoration: InputDecoration(hintText: 'Image',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                      //   border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                       
                      //   ),
                      //   ),
                       
                   
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Name',),
                          ),
                        ],
                      ),
                      TextFormField(decoration: InputDecoration(hintText: 'Name',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                       
                      ),),
                   
                        // SizedBox(height: 10,),
                   
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Features',),
                          ),
                        ],
                      ),
                      TextFormField(decoration: InputDecoration(hintText: 'Features',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                      
                      ),),
                   
                        // SizedBox(height: 10,),
                   
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Price',),
                          ),
                        ],
                      ),
                      TextFormField(decoration: InputDecoration(hintText: 'Price',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                       
                      ),),
                   
                        // SizedBox(height: 10,),
                   
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Year',),
                          ),
                        ],
                      ),
                      TextFormField(decoration: InputDecoration(hintText: 'Year',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                      
                      ),),
                   
                      
                   
                     
                   
                      
                      SizedBox(height: 40,),
                   
                      ElevatedButton(onPressed: (){

                         Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return RentUploadImage();
                  },));
                      }, 
                      style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 240, 124, 130))),
                      child: Text('Next',style: TextStyle(color: Colors.white),))
                   
                      
                      
                      
                   
                   
                   
                   
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