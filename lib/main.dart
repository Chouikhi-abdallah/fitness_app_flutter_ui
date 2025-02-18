import 'package:fitness_app_flutter_ui/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),

      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}
