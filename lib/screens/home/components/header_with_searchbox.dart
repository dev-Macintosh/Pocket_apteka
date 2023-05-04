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
        Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
                height: 56,
                margin: EdgeInsets.symmetric(horizontal: kPaddingOffset),
                padding: EdgeInsets.symmetric(horizontal: kPaddingOffset),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 50.0)
                    ]),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) => {},
                        style: TextStyle(color: kPrimaryColor),
                        decoration: InputDecoration(
                            hintText: "Введите название препарата",
                            hintStyle: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5)),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                    Image.asset(
                      "assets/images/search.png",
                      height: 30,
                    )
                  ],
                )))
      ]),
    );
  }
}