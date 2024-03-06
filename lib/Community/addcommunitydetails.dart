import 'package:flutter/material.dart';
import 'package:loginrace/Community/addimages.dart';

class CommunityAbout extends StatefulWidget {
  const CommunityAbout({super.key});

  @override
  State<CommunityAbout> createState() => _CommunityAboutState();
}

class _CommunityAboutState extends State<CommunityAbout> {
  var comm_name=TextEditingController();
  var about=TextEditingController();
  var awards=TextEditingController();
  var members=TextEditingController();
  var join=TextEditingController();
    final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

appBar: AppBar(backgroundColor: Color.fromARGB(255, 212, 119, 110),),
      
body: 
        
        SafeArea(
          
  
         child: Center(
           child: Padding(
             padding:  EdgeInsets.all(40.00),
             child: Form(
              key: _formKey,
               child: Container(
                
                
                width: 400,
                 child: SingleChildScrollView(
                   child: Padding(
                     padding: const EdgeInsets.only(top:20,bottom: 20),
                     child: Column(
                      
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('MEET OUR COMMUNITY', style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),),
                  
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Community Name',),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: comm_name,
                          validator: (value) {
                             if (value!.isEmpty) {
                        return 'enter name';
                          }
                          },
                          decoration: InputDecoration(hintText: 'Community Name',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                         
                          ),
                          ),
                        
                     
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('About',),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: about,
                          validator: (value) {
                             if (value!.isEmpty) {
                        return 'enter details';
                          }
                          },
                  maxLines: null, // This makes the TextFormField grow dynamically
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    labelText: 'Write something....',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 12.0),
                    border: OutlineInputBorder(),
                  ),
                ),
                     
                          // SizedBox(height: 10,),
                     
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Awards',),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: awards,
                          validator: (value) {
                             if (value!.isEmpty) {
                        return 'enter awarrds';
                          }
                          },
                          decoration: InputDecoration(hintText: 'Awards',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                        
                        ),),
                     
                          // SizedBox(height: 10,),
                     
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Add members',),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: members,
                          validator: (value) {
                             if (value!.isEmpty) {
                        return 'enter members';
                          }
                          },
                          decoration: InputDecoration(hintText: 'members',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                         
                        ),),
                     
                          // SizedBox(height: 10,),
                     
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Rate',),
                            ),
                          ],
                        ),
                        TextFormField(decoration: InputDecoration(hintText: 'Rate',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                        
                        ),),
               
                          Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Year of joining',),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: join,
                          validator: (value) {
                             if (value!.isEmpty) {
                        return 'enter year';
                          }
                          },
                          decoration: InputDecoration(hintText: 'year',fillColor: Color.fromARGB(112, 243, 214, 214),filled: true,
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                        
                        ),),
                     
                        
                     
                       
                     
                        
                        SizedBox(height: 40,),
                     
                        ElevatedButton(onPressed: (){
                          print(comm_name.text);
                          print(about.text);
                          print(members.text);
                          print(awards.text);
                          print(join.text);
                                                      if (_formKey.currentState!.validate()) {

               
                           Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return Communitygallery();
                    },));
                                                      }
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
         ),
       )


















    );
  }
}