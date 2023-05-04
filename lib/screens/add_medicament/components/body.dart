import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pocket_apteka/models/model.dart';
import 'package:pocket_apteka/screens/home/home_screen.dart';
import 'package:pocket_apteka/constants.dart';

class Body extends StatelessWidget {
  Body({super.key});
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(kPaddingOffset * 1.5),
      height: size.height * 0.7,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
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
                  Medicament med = new Medicament();
                  med.imageSrc = "assets/images/medicament_3.jpg";
                  med.name = nameController.text;
                  med.price = priceController.text;
                  med.country = countryController.text;
                  med.save(); 
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                }
              },
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(kPaddingOffset * 0.5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                child: Text(
                  "Создать",
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
