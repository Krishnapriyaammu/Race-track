import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loginrace/Community/communityacceptrejectuser.dart';
import 'package:loginrace/Community/viewprofileComm.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommunityViewRequest extends StatefulWidget {
  const CommunityViewRequest({super.key});

  @override
  State<CommunityViewRequest> createState() => _CommunityViewRequestState();
}

class _CommunityViewRequestState extends State<CommunityViewRequest> {
     late List<String> _rejectedBookingIds;
  late List<String> _acceptedBookingIds;

  @override
  void initState() {
    super.initState();
    _rejectedBookingIds = [];
    _acceptedBookingIds = [];
    _loadRejectedBookingIds(); // Load rejected booking IDs when initializing the page
  }

  Future<void> _loadRejectedBookingIds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _rejectedBookingIds = prefs.getStringList('rejectedBookingIds') ?? [];
    });
  }

  Future<void> _saveRejectedBookingIds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('rejectedBookingIds', _rejectedBookingIds);
  }

  Future<List<DocumentSnapshot>> getdata() async {
    try {
      final QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('auto_show_booking').get();

      print('Fetched ${snapshot.docs.length} documents');
      return snapshot.docs;
    } catch (e) {
      print('Error fetching data: $e');
      throw e;
    }
  }

  Future<bool> isPaymentSuccessful(String communityId) async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('autoshowpayments')
          .where('community_id', isEqualTo: communityId)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final paymentData = snapshot.docs.first.data() as Map<String, dynamic>;
        return paymentData['status'] == 'Successful';
      }
      return false;
    } catch (e) {
      print('Error fetching payment status: $e');
      return false;
    }
  }

  Future<void> updateBookingStatus(String bookingId) async {
    try {
      await FirebaseFirestore.instance
          .collection('auto_show_booking')
          .doc(bookingId)
          .update({'status': 1});
      setState(() {
        _rejectedBookingIds.remove(bookingId);
        _acceptedBookingIds.add(bookingId);
      });
      _saveRejectedBookingIds(); // Save updated rejected booking IDs
    } catch (e) {
      print('Error updating booking status: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Community Requests',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: getdata(),
          builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var documentData =
                      snapshot.data![index].data() as Map<String, dynamic>;
                  final bookingId = snapshot.data![index].id;
                  final bool isRejected =
                      _rejectedBookingIds.contains(bookingId);
                  final bool isAccepted =
                      _acceptedBookingIds.contains(bookingId);
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            documentData['name'] ?? '',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Other details here...

                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (!isAccepted && !isRejected)
                                ElevatedButton(
                                  onPressed: () {
                                    updateBookingStatus(bookingId);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white, backgroundColor: Colors.green,
                                  ),
                                  child: Text('Accept'),
                                ),
                              SizedBox(width: 16),
                              ElevatedButton(
                                onPressed: isAccepted || isRejected ? null : () {
                                  // Reject button action
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white, backgroundColor: isRejected ? Colors.red : Colors.grey,
                                ),
                                child: Text('Reject'),
                              ),
                              SizedBox(width: 16),
                              FutureBuilder<bool>(
                                future: isPaymentSuccessful(bookingId),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else {
                                    final bool paymentSuccessful = snapshot.data ?? false;
                                    return paymentSuccessful
                                        ? ElevatedButton(
                                            onPressed: null,
                                            style: ElevatedButton.styleFrom(
                                              foregroundColor: Colors.white, backgroundColor: Colors.grey,
                                            ),
                                            child: Text('Payment Complete'),
                                          )
                                        : SizedBox.shrink();
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}