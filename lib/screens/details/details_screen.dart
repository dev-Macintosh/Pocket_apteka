import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'components/body.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(
      {super.key,
      this.imageSrc = "",
      this.name = "",
      this.price = "",
      this.country = ""});
  final String imageSrc, price, name, country;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Body(
            imageSrc: imageSrc,
            name: this.name,
            price: this.price,
            country: this.country));
  }
}
