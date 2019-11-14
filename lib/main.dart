import 'package:awesome_list_flutterweb_ui/pages/main/main.dart';
import 'package:bird_flutter/bird_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome List',
      theme: ThemeData.dark(
      ).copyWith(
        primaryColor: Colors.blue,
      ),
      home: mainWidget(),
    );
  }
}
