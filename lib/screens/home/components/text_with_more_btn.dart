import 'package:flutter/material.dart';

import 'package:pocket_apteka/constants.dart';

class TextWithMoreBtn extends StatelessWidget {
  const TextWithMoreBtn({super.key, this.title="Recommended", this.press});
  final String title;
  final VoidCallback? press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingOffset),
      child: Row(
        children: [
          TextUnderline(text: title),
          Spacer(),
          TextButton(
            onPressed: press,
            child: Text(
              "more",
              style: TextStyle(color: kTextcolor),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)))),
          ),
        ],
      ),
    );
  }
}

class TextUnderline extends StatelessWidget {
  const TextUnderline({super.key, this.text = "Recommended"});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Padding(
            padding: EdgeInsets.all(kPaddingOffset / 4),
            child: Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            )),
        Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 7,
              margin: EdgeInsets.only(right: kPaddingOffset / 4),
              decoration: BoxDecoration(color: kPrimaryColor.withOpacity(0.25)),
            ))
      ]),
    );
  }
}