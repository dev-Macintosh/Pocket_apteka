import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Body extends StatelessWidget {
  Body({super.key});
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                  Navigator.pop(context);
                }
              },
              child: Text("Submit"),
            ),
          ],
        ),
      );
  }
}
