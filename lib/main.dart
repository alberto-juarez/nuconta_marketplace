//Libraries
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

//Models
import 'services/api.dart';

//Views
import 'views/main_view.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
        child: MaterialApp(
          title: 'NuConta Marketplace',
          theme: ThemeData(
            //Set the primary color of the app to the nu purple color
            primaryColor: Color.fromRGBO(139, 5, 190, 1),
          ),
          home: MainView(),
        ),
        //Sets the client to the one declared on the services folder
        client: client);
  }
}
