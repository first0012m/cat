import 'package:flutter/material.dart';

class Homeadmin extends StatefulWidget {
  Homeadmin({Key? key, m_username}) : super(key: key);

  @override
  _HomeadminState createState() => _HomeadminState();
}

class _HomeadminState extends State<Homeadmin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'แอดมิน',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('แอดมิน'),
        ),
        body: const Center(
          child: Text('ยินดีต้อนรับ'),
        ),
      ),
    );
  }
}