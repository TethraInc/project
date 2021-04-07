import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sixthapp/screens/donationScreen.dart';

class Organizations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF36ABB5),
      appBar: AppBar(
        backgroundColor: Color(0xFF25A0AB),
        title: Text('Organizations'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              children: organizations
                  .map(
                    (organizationName) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => DonationScreen(
                                organization: organizationName,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color(0xFF196E75),
                                width: 2,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                organizationName,
                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  color: Colors.black,
                                ),
                              ),
                              Icon(
                                Icons.arrow_right_rounded,
                                size: 30,
                                color: Color(0xFFEC2C6A),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList()),
        ),
      ),
    );
  }

  List<String> organizations = [
    'IBM',
    'Microsoft',
    'Apple',
    'Samsung',
    'One Plus',
    'Razer',
    'MSI',
  ];
}
