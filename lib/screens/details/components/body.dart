import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pocket_apteka/constants.dart';
import 'package:pocket_apteka/models/model.dart';
import 'dart:developer' as developer;
import 'images_and_icons.dart';
import 'title_and_price.dart';

class Body extends StatefulWidget {
  const Body(
      {super.key,
      required this.id,
      this.imageSrc = "",
      this.name = "",
      this.price = "",
      this.country = ""});
  final String imageSrc, name, price, country;
  final int id;
  @override
  State<Body> createState() => _Body();
}

class _Body extends State<Body> {
  callbackDelete() {
    developer.log('id = ${widget.id}');
     Medicament().select().id.equals(widget.id).delete();
     Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImageAndIcons(
            size: size,
            imageSrc: widget.imageSrc,
            callback: callbackDelete,
            id:widget.id,
            name:widget.name,
            price:widget.price,
            country:widget.country
          ),
          TitleAndPrice(
              title: widget.name, country: widget.country, price: widget.price),
          SizedBox(height: kPaddingOffset)
        ],
      ),
    );
  }
}
