//Libraries
import 'package:flutter/material.dart';
//Models
import '../models/offer.dart';
//Views
import 'product_detail.dart';

//Single card for an offer with a link to its details
class ProductCard extends StatefulWidget {
  final Offer offer;
  int balance;
  final String index;

  ProductCard(this.offer, this.balance, this.index);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: InkWell(
            key: Key(widget.index),
            //Go to the details page of the offer
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetail(
                      offer: widget.offer, balance: widget.balance)));
            },
            //Row with the image, name of the product and link
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Row(children: [
                  Hero(
                      tag: widget.offer.product.image,
                      child: ClipOval(
                          child: Image(
                        image: NetworkImage(widget.offer.product.image),
                        width: 70,
                        height: 70,
                      ))),
                  SizedBox(width: 10.0),
                  Text(widget.offer.product.name,
                      key: Key('text' + widget.index),
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
