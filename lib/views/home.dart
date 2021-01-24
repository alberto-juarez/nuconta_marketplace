//Libraries
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../services/api.dart';

//Models
import '../models/customer.dart';

//Views
import 'product_list.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(documentNode: gql(getCustomerQuery)),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          return Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              // appBar: AppBar(title: Text('NuConda Marketpace')),
              body: Stack(
                children: [
                  // Container(
                  //     height: MediaQuery.of(context).size.height - 82.0,
                  //     width: MediaQuery.of(context).size.width,
                  //     color: Colors.transparent),
                  Positioned(
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
                          ))),
                  Positioned(
                      top: 200.0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45.0),
                              topRight: Radius.circular(45.0),
                            ),
                            color: Colors.white),
                        height: MediaQuery.of(context).size.height - 100.0,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                            child: result.hasException
                                ? Text("$result.exception")
                                : result.loading
                                    ? CircularProgressIndicator()
                                    : ProductList(
                                        customer: Customer.fromJson(
                                            result.data['viewer']))),
                      )),
                ],
              ));
        });
  }
}
