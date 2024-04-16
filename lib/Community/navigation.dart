
import 'package:flutter/material.dart';
import 'package:loginrace/Community/communityhome.dart';
import 'package:loginrace/Community/communityviewrequest.dart';
import 'package:loginrace/Community/home3.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selectedindex=1;

  static  List<dynamic> _widgetoption= [
  
    ProfileViewPage(),
    CommunityViewRequest(),
    HomePayement(),
   
   
    
    
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


       BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.black,),
       label: 'Payment')
       ],

       type: BottomNavigationBarType.fixed,
       currentIndex: selectedindex,
       selectedItemColor: Colors.red,
       iconSize: 40,
       onTap: _ontopItem ,
      //  elevation: 5
       
       ),
       

      




    );
  }
}