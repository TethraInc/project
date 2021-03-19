//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:sixthapp/screens/background_painter.dart';

import 'hello.dart';

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
      appBar: AppBar(
        title: Text('Donate'),
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: CustomPaint(
              painter: BackgroundPainter(
                animation: _controller.view,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {
                    _controller.forward(from: 0);
                  },
                  child: Text('Animate'),
                ),
                RaisedButton(
                  onPressed: () {
                    /// [Navigator.push brings new screen over the app, HelloScreen in this case]
                    /// [Hello Screen is made in hello.dart file inside screens folder]
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PaymentDialog(),
                      ),
                    );
                  },
                  child: Text('Route to another Screen'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
