//Libraries
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../services/api.dart';

//Models
import '../models/customer.dart';

//Views
import 'main_data.dart';
import 'app_header.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    //Query to the endpoint to get the info and display it
    return Query(
        options: QueryOptions(documentNode: gql(getCustomerQuery)),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          return Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              body: Stack(
                children: [
                  //Contains the logo and the text on top of the MainView
                  AppHeader(),
                  //Container for the MainData, if loading displays a progress circle
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
                                ? Text(result.exception.toString())
                                : result.loading
                                    ? CircularProgressIndicator()
                                    : MainData(Customer.fromJson(
                                        result.data['viewer']))),
                      )),
                ],
              ));
        });
  }
}
