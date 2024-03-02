import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginrace/Admin/acceptrejectuser.dart';
import 'package:loginrace/Admin/adminacceptrejectracetrack.dart';
import 'package:loginrace/Admin/adminhome.dart';
import 'package:loginrace/Admin/adminviewcommunity.dart';
import 'package:loginrace/Admin/adminviewracetrack.dart';
import 'package:loginrace/Admin/adminviewrental.dart';

import 'package:loginrace/Admin/viewuser.dart';
import 'package:loginrace/Community/communityacceptrejectuser.dart';
import 'package:loginrace/Community/communityregis.dart';
import 'package:loginrace/Community/communityviewrequest.dart';
import 'package:loginrace/Community/navigation.dart';
import 'package:loginrace/Race%20track/event.dart';
import 'package:loginrace/Race%20track/registration.dart';
import 'package:loginrace/Rental/addrental.dart';
import 'package:loginrace/Rental/rentalregistration.dart';
import 'package:loginrace/Rental/rentalviewprofile.dart';
import 'package:loginrace/Rental/rentelhome.dart';
import 'package:loginrace/Rental/rentnotification.dart';
import 'package:loginrace/Rental/viewrentproducts.dart';
import 'package:loginrace/Rental/viewrequestrental.dart';
import 'package:loginrace/Rental/viewuseracceptreject.dart';
import 'package:loginrace/User/addpaymentdetails.dart';
import 'package:loginrace/User/chat.dart';
import 'package:loginrace/User/evntticketbooking.dart';
import 'package:loginrace/User/imagepicker.dart';
import 'package:loginrace/User/payemettype.dart';
import 'package:loginrace/User/rentuser.dart';
import 'package:loginrace/User/successfullpayement.dart';
import 'package:loginrace/User/ticketcart.dart';
import 'package:loginrace/User/userfeedback.dart';
import 'package:loginrace/User/userregis.dart';
import 'package:loginrace/User/userviewfeedback.dart';
import 'package:loginrace/User/viewautoshow.dart';
import 'package:loginrace/User/viewautoshowdetails.dart';
import 'package:loginrace/User/viewevents.dart';
import 'package:loginrace/User/viewgallery.dart';
import 'package:loginrace/User/viewinstructor.dart';
import 'package:loginrace/User/viewprofile.dart';
import 'package:loginrace/User/viewracetrack.dart';
import 'package:loginrace/User/viewrentalsearch.dart';
import 'package:loginrace/User/viewtrack.dart';
import 'package:loginrace/User/viewtrackdetails.dart';
import 'package:loginrace/User/griddd.dart';
import 'package:loginrace/Admin/viewuser.dart';
import 'package:loginrace/User/userviewfeedback.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState(); 
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

body: Center(child: 
              Center(
                child: Container(
                
                  width: 400,
                  
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: [
                        Image.asset('images/logo1.png'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          
                          children: [
                            Padding(padding: const EdgeInsets.all(10)),
                            Text('Enter username'),
                          ],
                        ),
                        TextFormField(decoration: InputDecoration(hintText: 'username',fillColor:  Color.fromARGB(111, 247, 73, 73),filled: true,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40))
                        ),
                        ),
                        SizedBox(height: 15,),
                        Container(child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(padding: const EdgeInsets.all(10)),
                            Text('Enter Password'),
                          ],
                        )),
                        TextFormField(decoration: InputDecoration(hintText: 'Password',fillColor:  Color.fromARGB(111, 247, 73, 73),filled: true,
                        border:OutlineInputBorder(borderRadius: BorderRadius.circular(40))
                        ),),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          
                          children: [
                             Align(
                  alignment: Alignment.centerLeft,
                  
                  child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: Color.fromARGB(255, 27, 23, 229),
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  
                  ),
                      Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return GridPageView1();
                  },));

                  }, child: Text('SIGN UP')),
                  //  child: Text(
                  //     'Sign Up',
                  //     style: TextStyle(
                  //       color: const Color.fromARGB(255, 24, 24, 24),
                  //       decoration: TextDecoration.underline,
                  //     ),
                  //   ),      
                            
                              
                      ),    
                          ],

                        ),
                        
                            
                            
                           
                            
                          
                        
                    SizedBox(height: 40,),
                        ElevatedButton(onPressed: (){
                       
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return  CommunityAcceptUser();
                  },));

                        },  style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 217, 149, 149))),
                        child: Text('Login',style: TextStyle(fontSize: 20,color: Colors.white),))
                    
                    ],
                    
                    
                    ),
                  ),
                ),
              )   
                 ),

    );
  }
}
