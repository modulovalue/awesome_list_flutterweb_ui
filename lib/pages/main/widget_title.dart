import 'dart:html';

import 'package:bird_flutter/bird_flutter.dart';
import 'package:flutter/material.dart';

Iterable<Widget> title() =>
    [
      apply
      & center()
      & textSize(48.0)
      & textWeight700()
      & textAlignC()
          > const Text("Awesome List"),

      apply
      & center()
      & textSize(14.0)
      & textWeight200()
          > onRowMinStartCenter() >> [
        textColor(Colors.white) & onTap(() =>
            window.open("https://github.com/Solido/awesome-flutter",
                "https://github.com/Solido/awesome-flutter")) > const Text(
            "Flutter"),
      ],
    ];
