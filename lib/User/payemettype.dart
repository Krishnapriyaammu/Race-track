import 'package:flutter/material.dart';

class PayementType extends StatefulWidget {
  const PayementType({super.key});

  @override
  State<PayementType> createState() => _PayementTypeState();
}

class _PayementTypeState extends State<PayementType> {
 dynamic get _selectedMethod => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(),

body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Choose your payment method',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Expanded(
          child: ListView(
            children: ListTile.divideTiles(
              context: context,
  tiles: [
                _optionTile('Credit card / Debit card', Icons.credit_card, 0),
                _optionTile('Cash on delivery', Icons.money, 1),
                _optionTile('Paypal', Icons.payment, 2),
                _optionTile('Google wallet', Icons.account_balance_wallet, 3),
              ],
            ).toList(),
          ),
        ),
        ElevatedButton(
          onPressed: () {
          },
 child: Text('PAY'),
          // color: Colors.red,
        ),
      ],
    ));
  }

  ListTile _optionTile(String title, IconData icon, int index) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      trailing: Radio(
        value: index,
        groupValue: _selectedMethod,
        onChanged: ( value) {
 setState(() {
          //  dynamic _selectedMethod = value;
          });
        },
      ),
    );
    
  }
}