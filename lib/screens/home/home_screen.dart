import 'package:flutter/material.dart';
import 'package:pocket_apteka/components/own_bottom_app_bar.dart';
import 'package:pocket_apteka/constants.dart';
import 'components/body.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: OwnBottomAppBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      toolbarHeight: 62,
      elevation: 0,
      leading: IconButton(
        icon: Image.asset("assets/images/menu.png"),
        onPressed: () => {},
      ),
    );
  }
}

