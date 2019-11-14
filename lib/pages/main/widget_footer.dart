import 'package:bird_flutter/bird_flutter.dart';
import 'package:flutter/material.dart';

Widget footer() {
  return opacity(0.1) > onRowMaxCenterCenter() >> <Widget>[
    const Text("Contact"),
    const Text("GitHub"),
    const Text("by @modulovalue"),
  ]
      .intersperse(const Text("•"))
      .intersperse(horizontalSpace(8.0));
}