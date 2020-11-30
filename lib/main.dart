import 'package:ativos/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(AppTodo());
}
Color primary = Colors.lightBlueAccent;

class AppTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData(primaryColor: primary),
      title: "Lista de produtos",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
