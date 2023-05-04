import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pocket_apteka/constants.dart';

class Body extends StatelessWidget {
  Body({super.key});
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
              decoration: InputDecoration(
                labelText: 'Страна',
                hintText: "Россия",
                border: OutlineInputBorder(),
              ),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pop(context);
                }
              },
              
              child: Container(
                width: size.width,
                
                padding: EdgeInsets.all(kPaddingOffset * 0.5),
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white),
                child: Text("Создать",textAlign: TextAlign.center,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
