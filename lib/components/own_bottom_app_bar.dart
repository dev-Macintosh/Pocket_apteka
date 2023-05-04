import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pocket_apteka/constants.dart';

class OwnBottomAppBar extends StatelessWidget {
  const OwnBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: kPaddingOffset * 2, right: kPaddingOffset * 2),
      height: 70,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -5),
              blurRadius: 35,
              color: kPrimaryColor,
            ),
          ],
          border: Border(top: BorderSide(color: kBackgroundColor, width: 3.0))),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/icons/pencil.svg")),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/icons/delete.svg"))
            ],
          ),
          Positioned(
              top: -55,
              left: 0,
              right: 0,
              child: IconButton(
                  iconSize: 100,
                  onPressed: () {},
                  icon: Container(
                      padding: EdgeInsets.all(kPaddingOffset / 4),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: kBackgroundColor, width: 3.0),
                          shape: BoxShape.circle,
                          color: Colors.white),
                      child: SvgPicture.asset("assets/icons/plus.svg")))),
        ],
      ),
    );
  }
}
