//Libraries
import 'package:flutter/material.dart';
//Models
import '../models/offer.dart';
//Views
import 'product_detail.dart';

class ProductCard extends StatelessWidget {
  final Offer offer;
  ProductCard(this.offer);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetail(offer: offer)));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Row(children: [
                  Hero(
                      tag: offer.product.image,
                      child: ClipOval(
                          child: Image(
                              image: NetworkImage(offer.product.image),
                              fit: BoxFit.fill,
                              height: 100.0,
                              width: 100.0))),
                  SizedBox(width: 10.0),
                  Text(offer.product.name,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold))
                ])),
                IconButton(
                    icon: Icon(Icons.chevron_right),
                    color: Colors.black,
                    onPressed: () {})
              ],
            )));
  }
}
