import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'components/body.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key,this.imageSrc=""});
  final String imageSrc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(imageSrc: imageSrc)
    );
  }
}