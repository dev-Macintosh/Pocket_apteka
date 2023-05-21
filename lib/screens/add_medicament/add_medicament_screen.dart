import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'components/body.dart';

class AddMedicamentScreen extends StatelessWidget {
  const AddMedicamentScreen(
      {super.key,
      this.imageSrc = "",
      this.name = "",
      this.price = "",
      this.country = "",
      this.id});
  final String imageSrc, price, name, country;
  final int? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body(
            id:id,
            imageSrc: imageSrc,
            name: this.name,
            price: this.price,
            country: this.country), resizeToAvoidBottomInset: false);
  }
}
