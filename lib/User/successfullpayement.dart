import 'package:flutter/material.dart';


class SuccessfullPayment extends StatefulWidget {
  const SuccessfullPayment({super.key});

  @override
  State<SuccessfullPayment> createState() => _SuccessfullPaymentState();
}

class _SuccessfullPaymentState extends State<SuccessfullPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
        title: Text('Payment '),
        // backgroundColor: Color.fromARGB(255, 219, 130, 134), // You can change the color based on your design
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Color.fromARGB(255, 20, 167, 37),
              size: 100.0,
            ),
            SizedBox(height: 20.0),
            Text(
              'Payment Successful!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            // Text(
            //   'Thank you for your purchase.',
            //   style: TextStyle(
            //     fontSize: 16.0,
            //   ),
            // ),
            SizedBox(height: 20.0),
            ElevatedButton(
              
              onPressed: () {
                
                Navigator.pop(context);
              },
               style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 237, 107, 122),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text('OK', style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,),
            ),
          ),  ],
        ),
      ),   

    );
  }
}