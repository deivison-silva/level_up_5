import 'package:flutter/material.dart';
import 'src/modules/home/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: Colors.deepOrange.shade900,
        accentColor: Colors.deepOrangeAccent.shade100,
      ),
      home: HomePage(),
    );
  }
}
