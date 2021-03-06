//Libraries
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/api.dart';

//Models
import '../models/offer.dart';

//Views
import 'money.dart';

//Displays the details of a product and provides
//the ability to purchase the offer, can be accessed
//when clicking on a product on the MainView
class ProductDetail extends StatefulWidget {
  final Offer offer;
  int balance;

  ProductDetail({Key key, @required this.offer, this.balance})
      : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool purchaseSucceded = false;
  @override
  Widget build(BuildContext context) {
    //Mutation wrapper so it refreshes the balance
    return Mutation(
        options: MutationOptions(
          documentNode: gql(tryToBuyMutation),
          onCompleted: (dynamic resultData) {
            //Update the current screen with
            //the data from the endpoint
            setState(() {
              widget.balance = resultData['purchase']['customer']['balance'];
              purchaseSucceded = resultData['purchase']['success'];
            });
            showDialog<AlertDialog>(
              context: context,
              builder: (BuildContext context) {
                //Displays an alert that lets the user
                //know if the purchase suceeded or not
                return AlertDialog(
                  title: Text(
                    purchaseSucceded
                        ? 'Purchase completed!'
                        : 'Purchase failed',
                  ),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text(purchaseSucceded
                            ? "Congrats!"
                            : resultData['purchase']['errorMessage']),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    SimpleDialogOption(
                      child: const Text('Close'),
                      key: Key('closeButton'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              },
            );
          },
        ),
        //Displays the offer details, balance available and
        //button to make the purchase
        builder: (RunMutation runMutation, QueryResult result) {
          return Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  key: Key('backButton'),
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: Text('Offer Details',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18.0,
                        color: Colors.white)),
                centerTitle: true,
              ),
              body: Stack(children: [
                Container(
                    height: MediaQuery.of(context).size.height - 82.0,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.transparent),
                Positioned(
                    top: 100.0,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45.0),
                              topRight: Radius.circular(45.0),
                            ),
                            color: Colors.white),
                        height: MediaQuery.of(context).size.height - 100.0,
                        width: MediaQuery.of(context).size.width)),
                Positioned(
                    top: 30.0,
                    left: (MediaQuery.of(context).size.width / 2) - 100.0,
                    child: Hero(
                        tag: widget.offer.product.name,
                        child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        widget.offer.product.image),
                                    fit: BoxFit.scaleDown)),
                            height: 200.0,
                            width: 200.0))),
                Positioned(
                    top: 250.0,
                    left: 25.0,
                    right: 25.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.offer.product.name,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 15.0),
                        Text('Product ID: ' + widget.offer.product.id,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12.0,
                                color: Colors.grey)),
                        Text('Offer ID: ' + widget.offer.id,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12.0,
                                color: Colors.grey)),
                        SizedBox(height: 10.0),
                        Text(
                            NumberFormat.simpleCurrency()
                                .format(widget.offer.price),
                            key: Key('offerPrice'),
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                color: Theme.of(context).primaryColor)),
                        SizedBox(height: 20.0),
                        Text(widget.offer.product.description,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 16.0,
                                color: Colors.black)),
                        SizedBox(height: 15.0),
                        //Displays the balance
                        MoneyView(widget.balance),
                        SizedBox(height: 5.0),
                        //Check if you already purchased the item
                        SizedBox(
                          width: double.infinity,
                          height: 50.0,
                          child: RaisedButton(
                            key: Key('buyButton'),
                            onPressed: purchaseSucceded
                                ? null
                                : () => runMutation({'id': widget.offer.id}),
                            color: Theme.of(context).primaryColor,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            child: Text(
                                purchaseSucceded
                                    ? 'You already bought this'
                                    : 'Buy the offer',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                          ),
                        )
                      ],
                    ))
              ]));
        });
  }
}
