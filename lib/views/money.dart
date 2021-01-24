//Libraries
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoneyView extends StatefulWidget {
  final balance;
  MoneyView(this.balance);

  @override
  _MoneyViewState createState() => _MoneyViewState();
}

class _MoneyViewState extends State<MoneyView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.black),
      height: 50.0,
      child: Center(
        child: Text(
            'Balance: ' + NumberFormat.simpleCurrency().format(widget.balance),
            style: TextStyle(
                color: Colors.white, fontFamily: 'Montserrat', fontSize: 20.0)),
      ),
    );
  }
}
