//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sixthapp/screens/background_painter.dart';
import 'package:sixthapp/screens/hello.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.forward(from: 0);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
              child: CustomPaint(
            painter: BackgroundPainter(
              animation: _controller.view,
            ),
          )),
          Align(
            alignment: Alignment(0.85, 0.85),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => Organizations()),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Container(
                  width: 160,
                  height: 40,
                  child: Stack(
                    children: [
                      Image(
                        height: 40,
                        width: 160,
                        fit: BoxFit.cover,
                        image: AssetImage('assets/organizations.jpg'),
                      ),
                      Container(
                        width: 160,
                        height: 40,
                        color: Colors.black12.withOpacity(0.4),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Organizations',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
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
