import 'package:flutter/material.dart';
import 'package:loginrace/Community/communityacceptrejectuser.dart';
import 'package:loginrace/Community/viewprofileComm.dart';

class CommunityViewRequest extends StatefulWidget {
  const CommunityViewRequest({super.key});

  @override
  State<CommunityViewRequest> createState() => _CommunityViewRequestState();
}

class _CommunityViewRequestState extends State<CommunityViewRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 142, 148),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CommViewProfile();
                }));
              },
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('images/imaaaa.jpg'),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 248, 213, 213),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return CommunityAcceptUser();
                        }));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'AWH ENGINEERING COLLEGE',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Icon(Icons.location_on, size: 16),
                                Text('KUTTIKATTOOR'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Icon(Icons.date_range, size: 16),
                                Text('09-12-2029'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Icon(Icons.access_time, size: 16),
                                Text('9 A.M'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Icon(Icons.timer, size: 16),
                                Text('Total Hours-4 Hrs'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
