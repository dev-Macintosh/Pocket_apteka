import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pocket_apteka/constants.dart';
import 'package:pocket_apteka/screens/add_medicament/add_medicament_screen.dart';

import 'icon_card.dart';

class ImageAndIcons extends StatefulWidget {
  const ImageAndIcons(
      {super.key,
      required this.size,
      required this.imageSrc,
      this.callback,
      required this.id,
      this.name = "",
      this.price = "",
      this.country = ""});
  final String? name, price, country;
  final String imageSrc;
  final Size size;
  final int id;
  final void Function()? callback;

  @override
  State<ImageAndIcons> createState() => _ImageAndIcons();
}

class _ImageAndIcons extends State<ImageAndIcons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kPaddingOffset),
      child: SizedBox(
        height: widget.size.height * 0.8,
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
                        icon: SvgPicture.asset(
                          "assets/icons/back_arrow.svg",
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    GestureDetector(
                        child: IconCard(icon: "assets/icons/pencil_edit.svg"),
                        onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddMedicamentScreen(name: widget.name ?? "",country: widget.country ?? "",price: widget.price ?? "",id:widget.id,imageSrc: widget.imageSrc,),
                                  ))
                            }),
                    GestureDetector(
                      child: IconCard(icon: "assets/icons/delete_edit.svg"),
                      onTap: widget.callback,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: widget.size.height * 0.8,
              width: widget.size.width * 0.75,
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
                  image: widget.imageSrc != ""
                      ? FileImage(new File(widget.imageSrc))
                      : AssetImage("assets/images/no-medicament.jpg")
                          as ImageProvider,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
