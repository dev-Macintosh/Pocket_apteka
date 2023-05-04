import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pocket_apteka/constants.dart';


class IconCard extends StatelessWidget {
  const IconCard({
    super.key,
    this.icon="",
  }) ;

  final String icon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
      padding: EdgeInsets.all(kPaddingOffset/ 2),
      height: 62,
      width: 62,
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 15),
            blurRadius: 22,
            color: kPrimaryColor.withOpacity(0.22),
          ),
          BoxShadow(
            offset: Offset(-4, -4),
            blurRadius: 10,
            color: Colors.white,
          ),
        ],
      ),
      child: SvgPicture.asset(icon,color: Colors.white,),
    );
  }
}