import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pocket_apteka/components/add_image.dart';
import 'package:pocket_apteka/models/model.dart';
import 'package:pocket_apteka/screens/home/home_screen.dart';
import 'package:pocket_apteka/constants.dart';
import 'dart:developer' as developer;

class Body extends StatelessWidget {
  Body(
      {super.key, this.id, this.imageSrc, this.name, this.price, this.country});
  final String? imageSrc, name, price, country;
  final int? id;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController nameController = TextEditingController(text: name);
  late TextEditingController priceController =
      TextEditingController(text: price);
  late TextEditingController countryController =
      TextEditingController(text: country);

  late ImageController imageController = ImageController(image:  imageSrc);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(kPaddingOffset * 1.5),
      height: size.height,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            addImage(
              controller: imageController,
            ),
            TextFormField(
              validator: (value) {
                return null;
              },
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Наименование препарата',
                border: OutlineInputBorder(),
                hintText: "Препарат",
              ),
            ),
            TextFormField(
              validator: (value) {
                return null;
              },
              controller: priceController,
              decoration: InputDecoration(
                labelText: 'Цена',
                hintText: "100",
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              validator: (value) {
                return null;
              },
              controller: countryController,
              decoration: InputDecoration(
                labelText: 'Страна',
                hintText: "Россия",
                border: OutlineInputBorder(),
              ),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  developer.log(id.toString());
                  switch (id) {
                    case null:
                      Medicament med = new Medicament();
                      med.imageSrc = imageController.image;
                      med.name = nameController.text != ""
                          ? nameController.text
                          : "НЕТ НАЗВАНИЯ";
                      med.price = priceController.text != ""
                          ? priceController.text
                          : "0 рублей";
                      med.country = countryController.text != ""
                          ? countryController.text
                          : "Нет страны";

                      med.save();
                      break;
                    default:
                      Medicament().select().id.equals(id).update({
                        "name": nameController.text,
                        "country": countryController.text,
                        "price": priceController.text,
                        "imageSrc":imageController.image
                      });
                      break;
                  }

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                }
              },
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(kPaddingOffset * 0.5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                child: Text(
                  "Создать/Редактировать",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
