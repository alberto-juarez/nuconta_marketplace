//Models
import 'offer.dart';

class Customer {
  Customer({
    this.id,
    this.name,
    this.balance,
    this.offers,
  });

  String id;
  String name;
  int balance;
  List<Offer> offers;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        name: json["name"],
        balance: json["balance"],
        offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "balance": balance,
        "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
      };
}
