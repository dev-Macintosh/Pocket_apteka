import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:pocket_apteka/screens/home/home_screen.dart';
void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pocket apteka',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,      
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextcolor),
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: HomeScreen()
    );
  }
}
