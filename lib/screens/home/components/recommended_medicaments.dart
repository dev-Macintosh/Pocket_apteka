import 'package:flutter/material.dart';
import 'package:pocket_apteka/constants.dart';

class RecommendedMedicaments extends StatelessWidget {
  const RecommendedMedicaments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicHeight(
        child: Row(
          children: [
            RecommendedMedicament(
              imageSrc: "assets/images/medicament_1.jpg",
              press: () => {},
              price: "100",
              name: "Даниил",
              country: "Россия",
            ),
            RecommendedMedicament(
              imageSrc: "assets/images/medicament_2.jpg",
              press: () => {},
              price: "200",
              name: "Иван",
              country: "Индия",
            ),
            RecommendedMedicament(
              imageSrc: "assets/images/medicament_3.jpg",
              press: () => {},
              price: "300",
              name: "Витя",
              country: "США",
            ),
          ],
        ),
      ),
    );
  }
}

class RecommendedMedicament extends StatelessWidget {
  const RecommendedMedicament(
      {super.key,
      this.imageSrc = "",
      this.press,
      this.price,
      this.name,
      this.country});
  final String imageSrc;
  final String? price, name, country;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(
            left: kPaddingOffset,
            bottom: kPaddingOffset * 2.25,
            top: kPaddingOffset / 2),
        width: size.width * 0.5,
        child: GestureDetector(
          onTap: press,
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.asset(
                      imageSrc,
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                padding: EdgeInsets.all(kPaddingOffset / 1.5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 50,
                          offset: Offset(0, 10),
                          color: kPrimaryColor.withOpacity(0.25))
                    ]),
                child: Row(children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "$name\n".toUpperCase(),
                        style: TextStyle(color: kPrimaryColor, fontSize: 14)),
                    TextSpan(
                        text: "$country".toUpperCase(),
                        style: TextStyle(color: kPrimaryColor, fontSize: 11))
                  ])),
                  Spacer(),
                  Text(
                    "\$$price",
                    style: TextStyle(color: Colors.black),
                  )
                ]),
              ),
            ],
          ),
        ));
  }
}
