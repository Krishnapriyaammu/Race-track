import 'package:flutter/material.dart';
import 'package:loginrace/Rental/addrental.dart';

class RentalEditprofile extends StatefulWidget {
  const RentalEditprofile({super.key});

  @override
  State<RentalEditprofile> createState() => _RentalEditprofileState();
}

class _RentalEditprofileState extends State<RentalEditprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(



appBar: AppBar(
   actions: [
         IconButton(
            icon: Icon(Icons.edit),
             onPressed: () {
              setState(() {
               
              });
            },
),
   ],
),
body:  

SingleChildScrollView(
  
  padding: const EdgeInsets.all(25.0),
  child: 
  
    Container(
      child: Column(
      
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          
                      width: 100.0,
                      height: 100.0,
                      margin: EdgeInsets.only(top: 16.0), // Adjust the margin as needed
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 227, 102, 113),
                      ),
        
      )
      
        
      ),
      SizedBox(height: 16.0),
      TextField(
                    
                    decoration: InputDecoration(
                      labelText: ' Name',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  SizedBox(height: 16.0),
                   TextField(
                    
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                    ),
                   
                  ),
                  SizedBox(height: 16,)  ,                                 
                   TextField(
                   
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 16.0),
      
                   TextField(
                    
                    decoration: InputDecoration(
                      labelText: 'place',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  SizedBox(height: 16.0),
      
                   TextField(
                
                    decoration: InputDecoration(
                      labelText: 'proof',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  SizedBox(height: 16.0),
      
                   
                  // SizedBox(height: 16.0),
      
                   SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return AddrentalProducts();
                  },));
                      },
                      
                      style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 240, 124, 130))),
                          child: Text('SUBMIT',style: TextStyle(color: Colors.white),)),
                  )
                     
               
        ],
      
      ),
    ),
  ),
);

    



  }
}

    
      