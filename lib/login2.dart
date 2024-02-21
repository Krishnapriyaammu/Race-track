import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                  color: Colors.amber,
                  width: 400,
                  
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          
                          children: [
                            Padding(padding: const EdgeInsets.all(20)),
                            Text('Enter username'),
                          ],
                        ),
                        TextFormField(decoration: InputDecoration(hintText: 'username',fillColor: Color.fromARGB(255, 174, 211, 230),filled: true,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40))
                        ),
                        ),
                        Container(child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(padding: const EdgeInsets.all(20)),
                            Text('Enter Password'),
                          ],
                        )),
                        TextFormField(decoration: InputDecoration(hintText: 'Password',fillColor: Color.fromARGB(255, 174, 211, 230),filled: true,
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
                   child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 24, 24, 24),
                        decoration: TextDecoration.underline,
                      ),
                    ),      
                            
                              
                      ),    
                          ],

                        ),
                        
                        
                            
                           
                            
                          
                        
                    SizedBox(height: 40,),
                        ElevatedButton(onPressed: (){}, child: Text('Login',style: TextStyle(fontSize: 20,),))
                    
                    ],
                    
                    
                    ),
                  ),
                ),
              )   
                 ),

    );
  }
}
