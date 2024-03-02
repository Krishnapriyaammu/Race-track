import 'package:flutter/material.dart';

class CommunityAcceptUser extends StatefulWidget {
  const CommunityAcceptUser({super.key});

  @override
  State<CommunityAcceptUser> createState() => _CommunityAcceptUserState();
}

class _CommunityAcceptUserState extends State<CommunityAcceptUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

appBar: AppBar(
      
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              
              children: [
                Container(
                  // decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(8)),
                  height: 300,width: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                         Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Container(
                              child: Column(
                                children: [
                                  Text('AWH ENGINEERING COLLEGE'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      
                     SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: Text(
                          'COLLEGE GROUND',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                     
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: Text(
                          'TOTAL HOURS-4HRS',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                     
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: Text(
                          'DATE-3-09-2024',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                         Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: Text(
                          'Total vehicles-20',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                       
                     
                     
                        
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                         
                              },
                              child: Text('Accept'),style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                            ),
                             ElevatedButton(
                              onPressed: () {
                                
                              },
                              child: Text('Reject'),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                            ),
                          ],),
                      ),
                    ],
                ),
                  ),
              ],
            ),
          ),
          ),
      ),



    );
  }
}