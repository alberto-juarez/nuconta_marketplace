//Libraries
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/foundation.dart';

final HttpLink httpLink = HttpLink(
  uri: 'https://staging-nu-needful-things.nubank.com.br/query',
);

final AuthLink authLink = AuthLink(
  getToken: () async => 'Bearer ENTER YOUR KEY HERE',
);

final Link link = authLink.concat(httpLink);

ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
  cache: InMemoryCache(),
  link: link,
));

final String getCustomerQuery = """
{
  viewer {
    id
    name
    balance
    offers {
      id
      price
      product {
        id
        name
        description
        image
      }
    }
  }
}
""";

final String tryToBuyMutation = """
mutation MutationRoot(\$id: ID!){
  purchase(offerId: \$id){
    success
    errorMessage
    customer {
      id
      name
      balance
    }
  }
}
""";
