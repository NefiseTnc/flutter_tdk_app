import 'package:flutter/material.dart';
import 'package:flutter_tdk_app/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tdk',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomePage(),
    );
  }
}
