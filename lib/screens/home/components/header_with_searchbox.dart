import 'package:flutter/material.dart';
import '../../../constants.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kPaddingOffset * 2.5),
      height: size.height * 0.2,
      child: Stack(children: [
        Container(
          padding: EdgeInsets.only(
              left: kPaddingOffset,
              right: kPaddingOffset,
              bottom: kPaddingOffset + 20),
          height: size.height * 0.2 - 27,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36)),
          ),
          child: Row(
            children: [
              Text(
                "Карманная аптека",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: kTextcolor),
              ),
              Spacer(),
              Image.asset(
                "assets/images/logo.png",
                height: 60,
              )
            ],
          ),
        ),
      ]),
    );
  }
}