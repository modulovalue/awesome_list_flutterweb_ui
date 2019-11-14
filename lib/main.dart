import 'package:awesome_list/pages/main/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(
      ).copyWith(
        primaryColor: Colors.blue,
      ),
      home: mainWidget(),
    );
  }
}
