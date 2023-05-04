import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pocket_apteka/models/model.dart';
import 'package:pocket_apteka/screens/home/home_screen.dart';

class Body extends StatelessWidget {
  Body({super.key});
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          TextFormField(
            validator: (value) {
              return null;
            },
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Наименование препарата',
              prefixIcon: Icon(Icons.person),
              suffixIcon: Icon(
                Icons.delete_outline,
                color: Colors.red,
              ),
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
              prefixIcon: Icon(Icons.date_range),
              suffixIcon: Icon(
                Icons.delete_outline,
                color: Colors.red,
              ),
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
              prefixIcon: Icon(Icons.date_range),
              suffixIcon: Icon(
                Icons.delete_outline,
                color: Colors.red,
              ),
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
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}
