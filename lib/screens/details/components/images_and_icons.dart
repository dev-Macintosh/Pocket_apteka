import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pocket_apteka/constants.dart';


import 'icon_card.dart';

class ImageAndIcons extends StatelessWidget {
  const ImageAndIcons({
    super.key,
    required this.size,
    required this.imageSrc
  });
  final String imageSrc;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kPaddingOffset),
      child: SizedBox(
        height: size.height * 0.8,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kPaddingOffset * 3),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        padding:
                            EdgeInsets.symmetric(horizontal: kPaddingOffset),
                        icon: SvgPicture.asset("assets/icons/back_arrow.svg",color: Colors.white,),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    IconCard(icon: "assets/icons/pencil_edit.svg"),
                    IconCard(icon: "assets/icons/delete_edit.svg"),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.8,
              width: size.width * 0.75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(63),
                  bottomLeft: Radius.circular(63),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 60,
                    color: kPrimaryColor.withOpacity(0.29),
                  ),
                ],
                image: DecorationImage(
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  image: AssetImage(imageSrc),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}