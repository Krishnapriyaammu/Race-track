import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

class ViewStatusPage extends StatefulWidget {
  final String ticketName;
  final double totalPrice;
  final int totalTickets;

  const ViewStatusPage(
      {Key? key,
      required this.ticketName,
      required this.totalPrice,
      required this.totalTickets})
      : super(key: key);

  @override
  State<ViewStatusPage> createState() => _ViewStatusPageState();
}

class _ViewStatusPageState extends State<ViewStatusPage> {
  Future<void> _downloadTicket() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Ticket Details:',
                style: pw.TextStyle(fontSize: 20),
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                'Ticket Name: ${widget.ticketName}',
                style: pw.TextStyle(fontSize: 18),
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                'Total Tickets: ${widget.totalTickets}',
                style: pw.TextStyle(fontSize: 18),
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                'Total Price: \$${widget.totalPrice.toStringAsFixed(2)}',
                style: pw.TextStyle(fontSize: 18),
              ),
            ],
          );
        },
      ),
    );

    final String dir = (await getExternalStorageDirectory())!.path;
    final String path = '$dir/ticket.pdf';
    final File file = File(path);
    await file.writeAsBytes(await pdf.save());
    print('PDF saved at $path');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ticket Details',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Color.fromARGB(255, 96, 150, 212),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ticket Name: ${widget.ticketName}',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Total Tickets: ${widget.totalTickets}',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Total Price: \$${widget.totalPrice.toStringAsFixed(2)}',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _downloadTicket,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Text(
                  'Download Ticket',
                  style: GoogleFonts.poppins(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
