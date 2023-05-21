import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pocket_apteka/constants.dart';
import 'package:pocket_apteka/screens/add_medicament/add_medicament_screen.dart';

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
          Positioned(
              top: -25,
              left: 0,
              right: 0,
              child: IconButton(
                  iconSize: 100,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddMedicamentScreen(),));
                  },
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
