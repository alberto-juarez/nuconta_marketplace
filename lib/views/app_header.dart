//Libraries
import 'package:flutter/material.dart';

//Contains the logo and the text on top of the MainView
class AppHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        key: Key('appHeader'),
        top: 0,
        child: Container(
            height: 200.0,
            child: Column(
              children: <Widget>[
                SizedBox(height: 100.0),
                Padding(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(children: [
                        Image(
                            image: AssetImage('assets/logo.png'),
                            height: 60,
                            width: 60),
                        Text('Marketplace',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0))
                      ]),
                    ],
                  ),
                ),
                SizedBox(height: 40.0),
              ],
            )));
  }
}
