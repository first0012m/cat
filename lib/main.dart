import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'home.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  Color _primaryColor= HexColor('#9999FF');
  Color _accentColor= HexColor('#CC99FF');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      home: SplashScreen(title: 'Flutter Login UI'),
    );
  }
}


