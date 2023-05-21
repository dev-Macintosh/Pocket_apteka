import 'package:flutter/material.dart';
import 'package:pocket_apteka/constants.dart';

class OwnMedicaments extends StatelessWidget {
  const OwnMedicaments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          OwnMedicament(imageSrc: "assets/images/medicament_4.jpeg",press:() => popupInfo(context,"assets/images/medicament_4.jpeg","Россия","200 р.","Парацетамол")),
          OwnMedicament(imageSrc: "assets/images/medicament_5.jpg",press:() => popupInfo(context,"assets/images/medicament_5.jpg","Россия","50 р.","Глицин")),
        ],
      ),
    );
  }
}
  popupInfo(BuildContext context,String imageSrc,String country,String price,String name) {
    showDialog(
        context: context,
        builder: (context) { 
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text(
              'Фото рекомендованного изображения',
              style: TextStyle(color: kPrimaryColor),
            ),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              child: Column(children: [Image.asset(imageSrc,height: 200,),Text("Наименование: ${name}",style: TextStyle(color: kPrimaryColor,),textAlign: TextAlign.start,),Text("Цена: ${price}",style: TextStyle(color: kPrimaryColor),textAlign: TextAlign.start,),Text("Страна: ${country}",style: TextStyle(color: kPrimaryColor),textAlign: TextAlign.start,)],crossAxisAlignment: CrossAxisAlignment.start,),
            ),
          );
        });
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
// class popupInfo extends StatelessWidget {
//   const popupInfo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//                   shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       content: Container(decoration: decora,),
//     )
//   }
// }

