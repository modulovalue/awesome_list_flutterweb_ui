import 'dart:html';

import 'package:bird_flutter/bird_flutter.dart';
import 'package:flutter/material.dart';

Widget contentTile({
  @required String title,
  @required String description,
  @required Widget trailing,
  @required void Function() tap,
}) =>
    apply
    & padding(vertical: 8.0)
    & card(color: Color.lerp(Colors.grey[800], Colors.grey[900], 0.6))
        > ListTile(
      trailing: trailing,
      onTap: tap,
      title: apply
      & padding(horizontal: 4.0, top: 8.0)
      & textSize(18.0)
      & textWeight700()
      & textColor(Colors.white)
          > Text(title),
      subtitle: apply
      & padding(horizontal: 4.0, bottom: 8.0)
          > onColumnMaxCenterStretch()
              >> textColor(Colors.white) * [
                verticalSpace(8.0),

                divider(),

                verticalSpace(12.0),

                textColor(Colors.white.withOpacity(0.8)) > Text(description),

//            verticalSpace(12.0),
//
//            divider(),
//
//            verticalSpace(12.0),
//
//            center()
//                > onWrapCenterCenter(allSpacing: 12.0)
//                >> [
//                  badge("Tag 1", "My tag"),
//                  badge("Tag 2", "My tag"),
//                  badge("Tag 2", "My tag"),
//                ],

                verticalSpace(4.0),
              ],
    );

Widget badge(String left, String right) {
  return textWeight500()
      > onRowMinCenterCenter() >> [
        badgeStyle(Colors.black) > Text(left),
        badgeStyle(Colors.blue[600]) > Text(right),
      ];
}

Applicator badgeStyle(Color color) =>
    apply((child) {
      return Container(
        child: child,
        padding: const EdgeInsets.symmetric(
          vertical: 4.0,
          horizontal: 8.0,
        ),
        height: 24.0,
        decoration: BoxDecoration(
          color: color,
        ),
      );
    });

Widget divider() =>
    apply
    & bgColor(Colors.white.withOpacity(0.1))
    & height(1)
    & width(200)
        > nothing;
