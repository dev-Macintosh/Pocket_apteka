import 'dart:io';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:pocket_apteka/constants.dart';
import 'package:pocket_apteka/models/model.dart';
import 'package:pocket_apteka/screens/details/details_screen.dart';

class RecommendedMedicaments extends StatefulWidget {
  const RecommendedMedicaments({super.key});

  @override
  State<RecommendedMedicaments> createState() => _RecommendedMedicamentsState();
}

class _RecommendedMedicamentsState extends State<RecommendedMedicaments> {
  List<Medicament> medicaments = [];

  loadAllMedicaments() async {
    final medicamentsDB = await Medicament().select().toList();
    setState(() {
      medicaments = medicamentsDB;
    });
  }

  @override
  void initState() {
    loadAllMedicaments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<RecommendedMedicament> buildMedicaments() {
      List<RecommendedMedicament> medicamentsList = [];
      for (var i = 0; i < medicaments.length; i++) {
        developer.log(medicaments[i].id.toString());
        medicamentsList.add(new RecommendedMedicament(
          imageSrc: medicaments[i].imageSrc ?? "",
          press: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    id: medicaments[i].id ?? 100,
                    imageSrc: medicaments[i].imageSrc ?? "",
                    price: medicaments[i].price ?? "",
                    name: medicaments[i].name ?? "",
                    country: medicaments[i].country ?? "",
                  ),
                )).then((value) => loadAllMedicaments())
          },
          price: medicaments[i].price,
          name: medicaments[i].name,
          country: medicaments[i].country,
        ));
      }
      return medicamentsList;
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicHeight(
        child: Row(children: buildMedicaments()),
      ),
    );
  }
}

// class RecommendedMedicaments extends StatelessWidget {
//   const RecommendedMedicaments({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: IntrinsicHeight(
//         child: Row(
//           children: [
//             RecommendedMedicament(
//               imageSrc: "assets/images/medicament_1.jpg",
//               press: () => {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => DetailScreen(
//                         imageSrc: "assets/images/medicament_1.jpg",
//                       ),
//                     ))
//               },
//               price: "100",
//               name: "Даниил",
//               country: "Россия",
//             ),
// RecommendedMedicament(
//   imageSrc: "assets/images/medicament_2.jpg",
//   press: () => {
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => DetailScreen(
//             imageSrc: "assets/images/medicament_2.jpg",
//           ),
//         ))
//   },
//   price: "200",
//   name: "Иван",
//   country: "Индия",
// ),
//             RecommendedMedicament(
//               imageSrc: "assets/images/medicament_3.jpg",
//               press: () => {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => DetailScreen(
//                         imageSrc: "assets/images/medicament_3.jpg",
//                       ),
//                     ))
//               },
//               price: "300",
//               name: "Витя",
//               country: "США",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class RecommendedMedicament extends StatelessWidget {
  const RecommendedMedicament(
      {super.key,
      required this.imageSrc,
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
                    child: imageSrc != ""
                        ? Image.file(
                            new File(imageSrc),
                            fit: BoxFit.cover,
                          )
                        : Image.asset("assets/images/no-medicament.jpg",fit: BoxFit.cover,)),
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
                    "$price",
                    style: TextStyle(color: Colors.black),
                  )
                ]),
              ),
            ],
          ),
        ));
  }
}
