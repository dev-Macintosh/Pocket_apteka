import 'package:flutter/material.dart';
import 'package:pocket_apteka/constants.dart';


class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({
    super.key,
    this.title,
    this.country,
    this.price,
  });

  final String? title, country,price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingOffset),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$title\n",
                  style: TextStyle(color: kTextcolor, fontWeight: FontWeight.bold),
                ),
                 TextSpan(
                  text: country,
                  style: TextStyle(
                    overflow:TextOverflow.clip,
                    fontSize: 20,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w300,
                    
                  ),
                  
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            "$price",
            style: TextStyle(color: kPrimaryColor),
          )
        ],
      ),
    );
  }
}