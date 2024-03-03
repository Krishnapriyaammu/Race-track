
import 'package:flutter/material.dart';
import 'package:loginrace/Community/addcommunitydetails.dart';
import 'package:loginrace/Community/communityviewrequest.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selectedindex=1;

  static const List<dynamic> _widgetoption= [
    CommunityAbout(),
    CommunityViewRequest(),
    // CommunityRegister(),
    
    
  ];
  void _ontopItem(int index){
    setState(() {
      selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //  title: const Text('Navigation'),
      //  backgroundColor: Color.fromARGB(255, 209, 147, 147),),

       body: Center(child: _widgetoption.elementAt(selectedindex)
       ),
       

       bottomNavigationBar: BottomNavigationBar(items: [BottomNavigationBarItem
       (icon: Icon(Icons.home,color: Colors.black,),
       label:'home',



       ),
       BottomNavigationBarItem(icon: Icon(Icons.repartition,color: Colors.black,),
       label:'Requests'),


      //  BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.black,),
      //  label: 'profile')
       ],

       type: BottomNavigationBarType.shifting,
       currentIndex: selectedindex,
       selectedItemColor: Colors.red,
       iconSize: 40,
       onTap: _ontopItem ,
       elevation: 5
       
       ),
       

      




    );
  }
}