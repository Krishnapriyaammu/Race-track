import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(color:Colors.white,width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('Enter Username'),
              ),
            ],
          ),
          TextFormField( maxLength: 10,decoration:InputDecoration(hintText: 'Username',fillColor:Color.fromARGB(255, 178, 204, 227),filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)))),),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('Enter password'),
              ),
            ],
          ),
          TextFormField( maxLength: 10,decoration: InputDecoration(hintText: 'Password',fillColor: Color.fromARGB(255, 178, 204, 227),filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)))),),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('forgot password',style: TextStyle(color: Color.fromARGB(255, 5, 137, 245)),),
            ],
          ),
          SizedBox(height: 40),
          ElevatedButton(onPressed: (){}, child: Text('LOGIN',style: TextStyle(color: Color.fromARGB(255, 40, 43, 235)),),),
         ],
      ),),
      )
      
      

    );
    




  }
}