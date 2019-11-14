import 'package:bird_flutter/bird_flutter.dart';
import 'package:flutter/material.dart';

Iterable<Widget> title() =>
    [
      apply
      & center()
      & _fadeFromLeft(0)
      & textSize(52.0)
      & textWeight700()
          > const Text("Awesome List"),

      verticalSpace(5.0),

      apply
      & center()
      & _fadeFromLeft(200)
      & textSize(14.0)
      & textWeight200()
          > onRowMinStartCenter() >> [
        textColor(Colors.white) > const Text("Flutter"),
//        opacity(0.3) > const Text("|"),
//        opacity(0.3) > const Text("More"),
      ].intersperse(horizontalSpace(6.0)),
    ];

Applicator _fadeFromLeft(int delayMS) =>
    apply
    & villainFadeIn(curve: Curves.easeOutCubic)
        .delayMS(delayMS)
        .inTimeMS(300)
    & villainTranslateX(from: -10.0, curve: Curves.easeOutCubic)
        .delayMS(delayMS)
        .inTimeMS(300);
