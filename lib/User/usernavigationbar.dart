import 'package:flutter/material.dart';
import 'package:loginrace/User/rentuser.dart';
import 'package:loginrace/User/viewevents.dart';
import 'package:loginrace/User/viewracetrack.dart';

class UserNavigationBar extends StatefulWidget {
  const UserNavigationBar({super.key});

  @override
  State<UserNavigationBar> createState() => _UserNavigationBarState();
}
class _UserNavigationBarState extends State<UserNavigationBar> {
   int selectedindex=1;
   static const List<dynamic>option=[
    ViewEvents(),
    ViewRacetrack(),
    RentUser(),


   ];
   void ontop(int index){
    setState(() {
      selectedindex=index;
    });
   }
    @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Center(child:option.
      elementAt(selectedindex),),
bottomNavigationBar: BottomNavigationBar(items: [
  BottomNavigationBarItem(icon: Icon(Icons.error,),label: 'complaints'),

  BottomNavigationBarItem(icon: Icon(Icons.home,),label: 'home'),

  BottomNavigationBarItem(icon: Icon(Icons.logout_outlined,),label: 'logout'),
],
type: BottomNavigationBarType.shifting,
currentIndex: selectedindex,
selectedItemColor: Color.fromARGB(255, 194, 47, 174),
unselectedItemColor: const Color.fromARGB(255, 13, 13, 14),
iconSize: 20,
onTap: ontop,
elevation: 5
),
    );
  }
}

 