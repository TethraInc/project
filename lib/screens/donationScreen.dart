import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DonationScreen extends StatelessWidget {
  final String organization;
  DonationScreen({this.organization});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF36ABB5),
      appBar: AppBar(
        title: Text('Donate'),
        centerTitle: true,
        backgroundColor: Color(0xFF25A0AB),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Text(
            'Donate to',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontSize: 42, color: Colors.white),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Text(
            organization,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: 48, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.3),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 70,
                decoration: BoxDecoration(
                  color: Color(0xFFEC2C6A),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Donate Now',
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
