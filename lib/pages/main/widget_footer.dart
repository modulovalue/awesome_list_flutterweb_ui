import 'dart:html';

import 'package:bird_flutter/bird_flutter.dart';
import 'package:flutter/material.dart';

Widget footer() {
  return opacity(0.2) > onRowMaxCenterCenter() >> <Widget>[
    onTap(() {
      window.open(
          "https://github.com/modulovalue/awesome_list_flutterweb_ui",
          "https://github.com/modulovalue/awesome_list_flutterweb_ui");
    }) > const Text("GitHub"),
    onTap(() {
      window.open("https://twitter.com/modulovalue",
          "https://twitter.com/modulovalue");
    }) > const Text("by @modulovalue"),
  ]
      .intersperse(const Text("•"))
      .intersperse(horizontalSpace(8.0));
}