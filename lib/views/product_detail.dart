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

class ProductDetail extends StatefulWidget {
  // Declare a field that holds the Todo.
  final Offer offer;

  ProductDetail({Key key, @required this.offer}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
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
                              image: NetworkImage(widget.offer.product.image),
                              fit: BoxFit.cover)),
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
                  SizedBox(height: 20.0),
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
                  SizedBox(height: 20.0),
                  Text(NumberFormat.simpleCurrency().format(widget.offer.price),
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
                  SizedBox(height: 50.0),
                  MoneyView(100),
                  SizedBox(height: 5.0),
                  Mutation(
                      options: MutationOptions(
                        documentNode: gql(tryToBuyMutation),
                        onCompleted: (dynamic resultData) {
                          showDialog<AlertDialog>(
                            context: context,
                            builder: (BuildContext context) {
                              var purchase = resultData['purchase'];
                              var purchaseCompleted = purchase['success'];
                              return AlertDialog(
                                title: Text(
                                  purchaseCompleted
                                      ? 'Purchase completed!'
                                      : 'Purchase failed',
                                ),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text(purchaseCompleted
                                          ? "Congrats!"
                                          : purchase['errorMessage']),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  SimpleDialogOption(
                                    child: const Text('Close'),
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
                      builder: (RunMutation runMutation, QueryResult result) {
                        return SizedBox(
                          width: double.infinity,
                          height: 50.0,
                          child: RaisedButton(
                            onPressed: () =>
                                runMutation({'id': widget.offer.id}),
                            color: Theme.of(context).primaryColor,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            child: Text('Buy the offer',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                          ),
                        );
                      }),
                ],
              ))
        ]));
  }
}
