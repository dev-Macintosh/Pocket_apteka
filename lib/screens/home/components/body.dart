import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pocket_apteka/constants.dart';
import 'header_with_searchbox.dart';
import 'recommended_medicaments.dart';
import 'text_with_more_btn.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        HeaderWithSearchBox(size: size),
        TextWithMoreBtn(
          title: "Рекомендованные лекарства",
          press: () {},
        ),
        RecommendedMedicaments(),
        TextWithMoreBtn(
          title: "Ваши лекарства",
          press: () {},
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              OwnMedicament(imageSrc: "assets/images/medicament_4.jpeg",press: ()=>{},),
              OwnMedicament(imageSrc: "assets/images/medicament_5.jpg",press: ()=>{},),
            ],
          ),
        )
      ]),
    );
  }
}

class OwnMedicament extends StatelessWidget {
  const OwnMedicament({
    super.key,this.imageSrc="",this.press
  });
  final String imageSrc;
  final VoidCallback? press;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        width: size.width * 0.8,
        height: 185,
        margin: EdgeInsets.only(
          left: kPaddingOffset,
          top: kPaddingOffset / 2,
          bottom: kPaddingOffset / 2,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            image: DecorationImage(
                image: AssetImage(
                  imageSrc,
                ),
                fit: BoxFit.cover)),
      ),
    );
  }
}
