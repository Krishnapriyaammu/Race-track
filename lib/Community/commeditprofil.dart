import 'package:flutter/material.dart';
import 'package:loginrace/Community/addcommunitydetails.dart';
import 'package:loginrace/Community/viewprofileComm.dart';

class Commueditprofile extends StatefulWidget {
  const Commueditprofile({super.key});

  @override
  State<Commueditprofile> createState() => _CommueditprofileState();
}

class _CommueditprofileState extends State<Commueditprofile> {
  var name=TextEditingController();
  var email=TextEditingController();
  var phone=TextEditingController();
  var place=TextEditingController();
  var proof=TextEditingController();
  var vehicles=TextEditingController();
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
        controller: name,
                    
                    decoration: InputDecoration(
                      labelText: ' Name',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  SizedBox(height: 16.0),
                   TextField(
                    controller: email,
                    
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                    ),
                   
                  ),
                  SizedBox(height: 16,)  ,                                 
                   TextField(
                    controller: phone,
                   
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 16.0),
      
                   TextField(
                    controller: place,
                    
                    decoration: InputDecoration(
                      labelText: 'place',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                   SizedBox(height: 16.0),
      
                   TextField(
                    controller: vehicles,
                    
                    decoration: InputDecoration(
                      labelText: 'Total vehicles',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  SizedBox(height: 16.0),
      
                   TextField(
                    controller: proof,
                
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
                        print(name.text);
                        print(email.text);
                        print(phone.text);
                        print(place.text);
                        print(proof.text);
                        print(vehicles.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return CommViewProfile();
                  },));
                      },
                      
                      style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 240, 124, 130))),
                          child: Text('DONE',style: TextStyle(color: Colors.white),)),
                  )
                     
               
        ],
      
      ),
    ),
  ),
















    );
  }
}