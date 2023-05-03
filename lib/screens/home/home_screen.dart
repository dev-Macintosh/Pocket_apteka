import 'package:flutter/material.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      toolbarHeight: 62,
      elevation: 0,
      leading: IconButton(icon: Image.asset("assets/images/menu.png"),onPressed: ()=>{},),
    );
  }
}
