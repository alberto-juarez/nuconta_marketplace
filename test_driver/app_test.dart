// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('NuConta Marketplace', () {
    final detailsButton = find.byValueKey('detailsButton0');
    final textdetailsButton = find.byValueKey('textdetailsButton0');
    final productList = find.byValueKey('productList');
    final offerPrice = find.byValueKey('offerPrice');
    final appHeader = find.byValueKey('appHeader');
    final balanceText = find.byValueKey('balanceText');
    final closeButton = find.byValueKey('closeButton');
    final buyButton = find.byValueKey('buyButton');
    final backButton = find.byValueKey('backButton');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    test(" - Balance loads", () async {
      await driver.waitFor(balanceText);
    });

    test(" - Header loads", () async {
      await driver.waitFor(appHeader);
    });

    test(" - First element loads", () async {
      await driver.waitFor(textdetailsButton);
    });

    test(" - Product detail loads", () async {
      await driver.waitFor(productList);
      await driver.waitFor(detailsButton);
      await driver.tap(detailsButton);
      await driver.waitFor(offerPrice);
    });
    test(" - Product detail can buy", () async {
      await driver.waitFor(buyButton);
      await driver.tap(buyButton);
      await driver.waitFor(closeButton);
      await driver.tap(closeButton);
    });
    test(" - Product detail goes to home", () async {
      await driver.waitFor(backButton);
      await driver.tap(backButton);
    });
  });
}
