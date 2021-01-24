//Libraries
import 'package:flutter/material.dart';

//Views
import 'money.dart';
import 'product_card.dart';

class ProductList extends StatelessWidget {
  final customer;
  ProductList({this.customer});

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: false,
      padding: EdgeInsets.only(left: 25.0, right: 20.0),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome: ',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0)),
              Text(customer.name,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                      fontSize: 20.0))
            ],
          ),
        ),
        Container(
            height: MediaQuery.of(context).size.height - 350.0,
            child: ListView.builder(
              itemCount: customer.offers.length,
              itemBuilder: (context, index) {
                return ProductCard(customer.offers[index]);
              },
            )),
        Padding(
            padding: EdgeInsets.only(top: 20),
            child: MoneyView(customer.balance)),
      ],
    );
  }
}
