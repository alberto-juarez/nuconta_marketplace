//Libraries
import 'package:flutter/material.dart';

//Models
import '../models/customer.dart';

//Views
import 'money.dart';
import 'product_card.dart';

//Has the customer name and iterates through the offers
class MainData extends StatefulWidget {
  Customer customer;

  MainData(this.customer);

  @override
  _MainDataState createState() => _MainDataState();
}

class _MainDataState extends State<MainData> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: false,
      padding: EdgeInsets.only(left: 25.0, right: 20.0),
      children: <Widget>[
        //Costumer name
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
              Text(widget.customer.name,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                      fontSize: 20.0))
            ],
          ),
        ),
        //List of the products and offers with a link to their details
        Container(
            key: Key('productList'),
            height: MediaQuery.of(context).size.height - 350.0,
            child: ListView.builder(
              itemCount: widget.customer.offers.length,
              itemBuilder: (context, index) {
                return ProductCard(
                    widget.customer.offers[index],
                    widget.customer.balance,
                    'detailsButton' + index.toString());
              },
            )),
        //Balance view
        Padding(
            padding: EdgeInsets.only(top: 20),
            child: MoneyView(widget.customer.balance)),
      ],
    );
  }
}
